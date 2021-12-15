#include <pigpio.h>
#include <iostream>
#include <chrono>
#include <thread>
#include <vector>

#include "Adafruit_ADS1X15_RPi/Adafruit_ADS1015.h"
#include <stdio.h>
#include <unistd.h>

#define pin_encoder 22


Adafruit_ADS1115 ads;


int contador = 0;
double referencia=0;


//assumes little endian
void printBits(size_t const size, void const * const ptr)
{
  unsigned char *b = (unsigned char*) ptr;
  unsigned char byte;
  int i, j;

  for (i=size-1;i>=0;i--) {
    for (j=7;j>=0;j--) {
      byte = (b[i] >> j) & 1;
      printf("%u", byte);
    }
  }
  //puts("");
}

void controlador_pendulo()
{
    int velocidade = 0;
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








int16_t adc0;


int main()
{
	gpioInitialise();
	ads.setGain(GAIN_ONE);
	ads.begin();

	std::cin.sync_with_stdio(false);
	while (1)
	{
		auto start = std::chrono::high_resolution_clock::now();

		auto t_inicial = std::chrono::system_clock::now();
		if(recebe_dado()) break;
		std::cout << referencia  << std::endl; //<< "\t" << contador << std::endl;
		std::this_thread::sleep_until(t_inicial + std::chrono::milliseconds(1000));
		adc0 = ads.readADC_SingleEnded(0);
		printBits(sizeof(adc0), &adc0);
		printf(" *** %d\n", adc0);
		usleep(100000);
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

















// The ADC input range (or gain) can be changed via the following
// functions, but be careful never to exceed VDD +0.3V max, or to
// exceed the upper and lower limits if you adjust the input range!
// Setting these values incorrectly may destroy your ADC!
//                                                                ADS1015  ADS1115
//                                                                -------  -------
// ads.setGain(GAIN_TWOTHIRDS);  // 2/3x gain +/- 6.144V  1 bit = 3mV      0.1875mV (default)
// ads.setGain(GAIN_ONE);        // 1x gain   +/- 4.096V  1 bit = 2mV      0.125mV
// ads.setGain(GAIN_TWO);        // 2x gain   +/- 2.048V  1 bit = 1mV      0.0625mV
// ads.setGain(GAIN_FOUR);       // 4x gain   +/- 1.024V  1 bit = 0.5mV    0.03125mV
// ads.setGain(GAIN_EIGHT);      // 8x gain   +/- 0.512V  1 bit = 0.25mV   0.015625mV
// ads.setGain(GAIN_SIXTEEN);    // 16x gain  +/- 0.256V  1 bit = 0.125mV  0.0078125mV



