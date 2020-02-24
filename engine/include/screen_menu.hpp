//
// Created by hugo on 23/11/2019.
//

#ifndef R_TYPE_SCREEN_MENU_HPP
#define R_TYPE_SCREEN_MENU_HPP

#include "cScreen.hpp"
#include "assets_manager.hpp"
#include "game_info.hpp"

class screen_menu : public cScreen, public AssetsManager
{
public:
    screen_menu(game_info *);
    ~screen_menu();
    int connectToRoom(std::vector<std::string> port, std::string playerName);
    virtual int Run(sf::RenderWindow &App);
    game_info *gameInfo;

private:
    bool _setNext;
    bool _setPlay;
    bool _setCreateRoom;
    bool _timeout;
    int _port;
    bool _refresh;
    int _nbRoom;
};

#endif //R_TYPE_SCREEN_MENU_HPP
