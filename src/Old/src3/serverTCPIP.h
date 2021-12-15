#ifndef SERVERTCPIP_H
#define SERVERTCPIP_H

#include <iostream>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>
#include <netdb.h>
#include <string>
#include <cstring>
#include <memory>
//#include <fcntl.h> //Para tirar o bloqueio da função recv()


int clientSocket;
int listening;

int TCPIP_connect() 
{
    dprint("----------------------------");
    dprint("|    TCPIP_open_connect()  |");
    dprint("----------------------------");

    dprint("[TCPIP]  Create a socket");
    
    listening = socket(AF_INET, SOCK_STREAM, 0);
    //fcntl(listening, F_SETFL, fcntl(listening, F_GETFL) | O_NONBLOCK); //Tirar o bloqueio da função recv()

    if (listening == -1)
    {
        dprint("[TCPIP]  Can't create a socket! Quitting");
        return -1;
    }

    dprint("[TCPIP]  Bind the ip address and port to a socket");
    sockaddr_in hint;
    hint.sin_family = AF_INET;
    hint.sin_port = htons(54000);
    inet_pton(AF_INET, "0.0.0.0", &hint.sin_addr);
 
    bind(listening, (sockaddr*)&hint, sizeof(hint));
 
    dprint("[TCPIP]  Tell Winsock the socket is for listening");

    listen(listening, SOMAXCONN);
    
    return 0;
}

int TCPIP_listen_mode()
{
    dprint("----------------------------");
    dprint("|    TCPIP_listen_mode()   |");
    dprint("----------------------------");

    dprint("[TCPIP]  Wait for a connection");

    sockaddr_in client;
    socklen_t clientSize = sizeof(client);
 
    clientSocket = accept(listening, (sockaddr*)&client, &clientSize);
 
    char host[NI_MAXHOST];      // Client's remote name
    char service[NI_MAXSERV];   // Service (i.e. port) the client is connect on
 
    memset(host, 0, NI_MAXHOST);
    memset(service, 0, NI_MAXSERV);

    
    if (getnameinfo((sockaddr*)&client, sizeof(client), host, NI_MAXHOST, service, NI_MAXSERV, 0) == 0)
    {
        dprint("[TCPIP]  Connected on IP: " << host);
        dprint("[TCPIP]  Connected on port: " << service);
    }
    else
    {
        inet_ntop(AF_INET, &client.sin_addr, host, NI_MAXHOST);
        dprint("[TCPIP]  Connected on IP: " << host);
        dprint("[TCPIP]  Connected on port: " << ntohs(client.sin_port));
    }
    
    
    return 0;
}

int TCPIP_close_mode()
{
    dprint("----------------------------");
    dprint("|    TCPIP_close_mode()    |");
    dprint("----------------------------");
    
    close(clientSocket);// Close the socket
 
    return 0;
}






double TCPIP_read() //Test mode
{
    dprint("passou aqui");
    int bytesReceived;
    char buf[4096];       //Cria o buffer
    memset(buf, 0, 4096); //Zera o buffer
    //if(select(clientSocket, NULL, NULL, NULL, NULL)) //Se tiver bites disponiveis
        bytesReceived = recv(clientSocket, buf, 4096, 0); //bytesReceived recebe a quantidade de bytes recebidos e buf recebe os bytes em sí
    if (bytesReceived <1) //Erro na função
    {
        dprint("Error in recv(). \n Quitting...");
        return -1;
    }
    dprint("passou aqui2");
    dprint("CLIENT> " << std::string(buf, 0, bytesReceived));
    
    if (buf[0]=='x')  
    {
        dprint("Comando para fechar");
        return -3; //Feche o programa
    }
    //Se tudo estiver correto, então converta buf na referência
    std::string::size_type sz;
    //char resposta[] = "r 15500000"; //exemplo de resposta: 'r' de referencia.
    //for(int k=2;k<bytesReceived;k++) resposta[k-2]=buf[k];
    //char * pedaco;//string pedaco;    
    //pedaco = strtok (resposta," ");
    //return ((double)std::stoi(pedaco,&sz));
    return ((double)std::stoi(strtok (buf," "),&sz));
}

#endif