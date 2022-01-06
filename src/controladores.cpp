#include <pigpio.h>
#include <iostream>
#include <chrono>
#include <thread>
#include <vector>

#define pin_encoder  22
#define pin_pwm_tra  23
#define pin_pwm_tra2 24

#define tax_amo 100

int contador = 0;

double referencia=0;
double velocidade=0;
double Sc=0;



void conte (int, int, uint32_t)
{
    contador++;
}



double mede_velocidade()
{
	//static auto t_anterior = std::chrono::high_resolution_clock::now();
	//auto t_atual = std::chrono::high_resolution_clock::now();
	//auto delta_t = std::chrono::duration_cast<std::chrono::milliseconds>(t_atual - t_anterior);
	//double velocidade = contador * (0.28/60) / ((double) delta_t.count()/1000);
	double velocidade = contador * 0.046666; // contador * (0.28m / 60furos) / 0.1s
	contador = 0;
	//t_anterior = t_atual;
    return velocidade;
}



double PHT(double duty)
{
	double zm   =   0;
	double up   =  24;
	double down = -24;

    if(duty != 0)                            //Se o duty é diferente de 0
    {
        if      (duty >    0)   duty +=   zm; // soma a Zona Morta
        else if (duty <    0)   duty +=  -zm;
        if      (duty >   up)   duty  =   up; // e Verifica Saturacao
        else if (duty < down)   duty  = down;
    }

    if (duty>0)
    {
        gpioPWM(pin_pwm_tra, duty*20000/24); //Full: 20.000
        gpioPWM(pin_pwm_tra2, 0); //Full: 20.000
    }
    else
    {
        gpioPWM(pin_pwm_tra, 0); //Full: 20.000
        gpioPWM(pin_pwm_tra2, -duty*20000/24); //Full: 20.000
    }
    return duty;
}


void controlador_velocidade()
{
    velocidade = mede_velocidade();
}


void sinal_direto()
{
    velocidade = mede_velocidade();
	Sc=PHT(referencia*24);
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
			case '2': //Referencia Negativa + Sinal Direto
				referencia = -( (double)
				//(bytes[0] - '0') * 10000 +
				(bytes[1] - '0') * 1000  +
				(bytes[2] - '0') * 100   +
				(bytes[3] - '0') * 10    +
				(bytes[4] - '0')
				)*0.001;

				sinal_direto();
			break;
			
			case '1': //Referencia  + Sinal Direto
				referencia = ( (double)
				//(bytes[0] - '0') * 10000 +
				(bytes[1] - '0') * 1000  +
				(bytes[2] - '0') * 100   +
				(bytes[3] - '0') * 10    +
				(bytes[4] - '0')
				)*0.001;

				sinal_direto();
			break;

			case '0': //Referencia + Controlador velocidade
				referencia = ( (double)
				//(bytes[0] - '0') * 10000 +
				(bytes[1] - '0') * 1000  +
				(bytes[2] - '0') * 100   +
				(bytes[3] - '0') * 10    +
				(bytes[4] - '0')
				)*0.001;

				controlador_velocidade();
			break;

			case 'x'://Fechar programa
				return 1;
		}
	}
	return 0;
}











int main()
{
	std::cin.sync_with_stdio(false); //Configuração da entrada e saida padrão

	//Configurações da GPIO
	gpioInitialise();
	
	//Pino conectado ao encoder
	gpioSetMode(pin_encoder, PI_INPUT);
	gpioSetPullUpDown(pin_encoder,PI_PUD_UP);
    gpioSetISRFunc(pin_encoder, EITHER_EDGE, 0, conte);
	
	//Pinos conectados a ponte H
	gpioSetMode(pin_pwm_tra, PI_OUTPUT);
	gpioSetMode(pin_pwm_tra2, PI_OUTPUT);
	gpioSetPWMfrequency(pin_pwm_tra, 1000);
	gpioSetPWMfrequency(pin_pwm_tra2, 1000);
	gpioSetPWMrange(pin_pwm_tra, 20000);
	gpioSetPWMrange(pin_pwm_tra2, 20000);
	gpioPWM(pin_pwm_tra, 0);
	gpioPWM(pin_pwm_tra2, 0);

	
	//Loop padrão
	auto start = std::chrono::high_resolution_clock::now();
	while (1)
	{
		auto t_inicial = std::chrono::system_clock::now();
		if(recebe_dado()) break;
		std::this_thread::sleep_until(t_inicial + std::chrono::milliseconds(tax_amo));
		auto t_atual = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::high_resolution_clock::now() - start);
		std::cout << referencia << "\t" << velocidade << "\t" << Sc << "\t" << t_atual.count() << std::endl;
	}
	//Finaliza execução
	gpioPWM(pin_pwm_tra, 0);
	gpioPWM(pin_pwm_tra2, 0);
	gpioTerminate();
	return 0;
}


//auto start = std::chrono::high_resolution_clock::now();
//auto end = std::chrono::high_resolution_clock::now();
//auto int_s = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
//std::cout << int_s.count() << std::endl;

//int gpioHardwarePWM(unsigned gpio, unsigned PWMfreq, unsigned PWMduty);
