//
// Created by hugo on 25/11/2019.
//

#ifndef R_TYPE_SCREEN_LOBBY_HPP
#define R_TYPE_SCREEN_LOBBY_HPP

#include "cScreen.hpp"
#include "assets_manager.hpp"
#include "game_info.hpp"
#include "music.hpp"

class screen_lobby : public cScreen, public AssetsManager {
public:
    screen_lobby(game_info*, Music*);
    ~screen_lobby();
    virtual int Run(sf::RenderWindow &App);

private:
    int _nbPlayer;
    game_info *gameInfo;
    Music *_music;
};

#endif //R_TYPE_SCREEN_LOBBY_HPP
