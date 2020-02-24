//
// Created by constant on 27/11/2019.
//

#ifndef R_TYPE_GAME_INFO_HPP
#define R_TYPE_GAME_INFO_HPP

#include "player.hpp"

class game_info {
public:
    game_info();
    ~game_info();

    std::vector<Player> _playerList;
    int _portRoom;
    std::string _nameRoom;
    std::string _ip;
    int _actualPlayerID;
    int wave;
};


#endif //R_TYPE_GAME_INFO_HPP
