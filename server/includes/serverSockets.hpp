/*
** EPITECH PROJECT, 2019
** Rtype | EPITV Team + Maxime
** File description:
** main.cpp
*/

#ifndef R_TYPE_SERVERSOCKETS_HPP
#define R_TYPE_SERVERSOCKETS_HPP

#include "libs.hpp"

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
    char playersPositons[1024];
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

class serverSockets {
public:
    serverSockets(int);
    ~serverSockets() = default;
public:
    boost::asio::io_service io_service;
    udp::socket socket{io_service};
    binaryProtocol structBuffer;
    udp::endpoint remote_endpoint;
    char _buffer[sizeof(binaryProtocol)];
    int port;

    void Sender(binaryProtocol in, std::string IP, int PORT);
    void handle_receive(const boost::system::error_code &error, size_t bytes_transferred);
    void wait();
    void Receiver();
};

#endif //R_TYPE_SERVERSOCKETS_HPP
