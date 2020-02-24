//
// Created by constant on 23/11/2019.
//

#ifndef R_TYPE_SERVERSOCKETS_HPP
#define R_TYPE_SOCKETS_HPP

#define IPADDRESS "0.0.0.0"
#define UDP_PORT 4242

#include <boost/asio.hpp>
#include <boost/array.hpp>
#include <boost/bind.hpp>
#include <thread>
#include <iostream>

using boost::asio::ip::udp;
using boost::asio::ip::address;

struct binaryProtocol
{
    bool isEmpty;
    int ope;
    //createRoom Data
    char roomName[1024];
    char playerName[1024];
    int port;
    //refresh Data
    char roomList[1024];
    char playerList[1024];
    //Movement Data
    char movementDir[1024];
    int playerID;
    int posX;
    int posY;
    int speed;
    //All players positions
    char playersPositions[1024];
    //bullets
    int bulletPosX;
    int bulletPosY;
    int bulletSpeed;
    char bulletPositionList[2048];
    //Enemies
    int enemySpeed;
    int enemyPosX;
    int enemyPosY;
    char enemyPosLists[2048];
    int enemyID;
};

class Sockets {
public:
    Sockets(int);
    ~Sockets() = default;
public:
    boost::asio::io_service io_service;
    udp::socket socket{io_service};
    binaryProtocol structBuffer;
    udp::endpoint remote_endpoint;
    binaryProtocol request;
    int port;
    char _buffer[sizeof(binaryProtocol)];

    void Sender(binaryProtocol in, std::string IP, int PORT);
    void handle_receive(const boost::system::error_code &error, size_t bytes_transferred);
    void wait();
    void Receiver();
    bool WaitResponse(Sockets*);
};

#endif //R_TYPE_SERVERSOCKETS_HPP
