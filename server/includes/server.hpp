/*
** EPITECH PROJECT, 2019
** Rtype | EPITV Team + Maxime
** File description:
** main.cpp
*/

#ifndef R_TYPE_SERVER_HPP
#define R_TYPE_SERVER_HPP


#define UDP_PORT 4242

#include "libs.hpp"
#include "player.hpp"
#include "bullets.hpp"
#include "Enemy.hpp"
#include "room.hpp"
#include "serverSockets.hpp"

using boost::asio::ip::udp;
using boost::asio::ip::address;

class Game {
public:
    Game() = default;
    virtual ~Game() = default;
    //lists
    std::vector<std::thread> roomThreads;
    std::vector<Room> roomList;
    std::list<Player> playerList;
    std::list<std::thread> threadList;
};


#endif //R_TYPE_SERVERSOCKETS_HPP
