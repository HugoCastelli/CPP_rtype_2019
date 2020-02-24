/*
** EPITECH PROJECT, 2019
** Rtype | EPITV Team + Maxime
** File description:
** main.cpp
*/

#ifndef R_TYPE_ROOM_HPP
#define R_TYPE_ROOM_HPP

class Room {
public:
    Room();
    virtual ~Room() = default;

    int roomId;
    std::string roomName;
    std::vector<Player> playerList;
    std::vector<Bullets> bulletList;
    std::vector<Enemy> enemyList;
    std::vector<std::string> ipList;
    bool isStarted;
};

#endif //R_TYPE_ROOM_HPP
