/*
** EPITECH PROJECT, 2019
** Rtype | EPITV Team + Maxime
** File description:
** main.cpp
*/

#ifndef R_TYPE_PLAYER_HPP
#define R_TYPE_PLAYER_HPP

class Player {
public:
    Player() = default;
    virtual ~Player() = default;

    int playerID;
    int roomId;
    int posX;
    int posY;
    std::string playerName;
};





#endif //R_TYPE_PLAYER_HPP
