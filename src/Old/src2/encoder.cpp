#include <pigpio.h>
#include <iostream>
#include <chrono>
#include <thread>

#define pin_encoder 22



int contador = 0;

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

int ler_referencia()
{
    int referencia;
    std::cin>>referencia;
    return referencia/1000;
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

int main()
{
    gpioInitialise();
    gpioSetISRFunc(pin_encoder, EITHER_EDGE, 0, conte);

    while (1)
    {
        auto t_inicial = std::chrono::system_clock::now();
        int leitura = ler_referencia();
        if (leitura)
        {
            std::cout << leitura << std::endl;
        }
        //controlador_velocidade();
        std::this_thread::sleep_until(t_inicial + std::chrono::milliseconds(10));
    }  
    gpioTerminate();
}