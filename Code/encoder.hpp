#include <pigpio.h>
#include <iostream>


#define pin_encoder 22


int contador = 0;

void conte (int, int, uint32_t) //Deve vir primeiro
{
    contador++;
}

void inicializa_GPIO()
{
    gpioInitialise();
    gpioSetISRFunc(pin_encoder, EITHER_EDGE, 0, conte);
}

void finaliza_GPIO()
{
    gpioTerminate();
}

int mede_velocidade()
{
    return 0;
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




void controlador_velocidade(double referencia)
{
    std::cout<<contador<<std::endl;
}
