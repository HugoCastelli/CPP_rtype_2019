//
// Created by hugo on 23/11/2019.
//

#ifndef R_TYPE_SCREEN_GAME_HPP
#define R_TYPE_SCREEN_GAME_HPP

#include "cScreen.hpp"
#include "assets_manager.hpp"

class screen_game : public cScreen, public AssetsManager
{
public:
    screen_game();
    ~screen_game();
    virtual int Run(sf::RenderWindow &App);

private:
    int alpha_max;
    int alpha_div;
    bool playing;
};

#endif //R_TYPE_SCREEN_GAME_HPP
