//
// Created by hugo on 24/11/2019.
//

#ifndef R_TYPE_SCREEN_SETTINGS_HPP
#define R_TYPE_SCREEN_SETTINGS_HPP

#include "cScreen.hpp"
#include "assets_manager.hpp"
#include "music.hpp"

class screen_settings : public cScreen, public AssetsManager {
public:
    screen_settings(game_info*, Music*);
    ~screen_settings();
    virtual int Run(sf::RenderWindow &App);

private:
    bool editHostname;
    bool editPort;
    bool editVolume;
    game_info *gameInfo;
    Music *_music;

};

#endif //R_TYPE_SCREEN_SETTINGS_H
