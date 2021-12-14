//DEBUG deve vir primeiro
#define debug                                     //Ativa o modo DEBUG (Commente para desabilitar)
#ifdef debug                                      //Se o DEBUG estiver ativo
    #define dprint(x)   std::cout<<x<<std::endl   //Substitua dprint(x) por cout<<x<<endl (std)
#else                                             //Se não estiver ativo
    #define dprint(x)                             //Subistitua por nada
#endif

#include "serverTCPIP.h"
#include "encoder.hpp"
#include <chrono>
#include <thread>

int referencia = 0;

int  main (int argc, char **argv)
{
  inicializa_GPIO();
  TCPIP_connect();            //Abra a coneção TCP/IP

  while (true)
  {
    TCPIP_listen_mode();      //Espere no modo listen até alguém conectar
    while (true)
    {
      auto t_inicial = std::chrono::system_clock::now();
      double resposta = TCPIP_read();
      if(resposta<0)
      {
        if (resposta==-3)
        {
          finaliza_GPIO();
          TCPIP_close_mode();         //feche a conexão TCP/IP
          close(listening);           //Feche o soket
          return 0;                   //Retorne que a execução foi bem sucedida
        }
        else break;
      }
      controlador_velocidade(resposta);//Somente será passada a referencia se a resposta for maior ou igual a 0
      std::this_thread::sleep_until(t_inicial + std::chrono::milliseconds(1000));
    }
    dprint("New Cicle");      //Avise o usuario o reinicio do processo se o DEBUG estiver ativado
    TCPIP_close_mode();       //Mas antes de reinciar o processo, feche a conexão
  }
}
