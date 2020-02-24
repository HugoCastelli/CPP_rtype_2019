//
// Created by hugo on 23/11/2019.
//

#ifndef R_TYPE_CSCREEN_HPP
#define R_TYPE_CSCREEN_HPP

#include <SFML/Window.hpp>
#include <SFML/Graphics.hpp>
#include <boost/algorithm/string.hpp>
#include "sockets.hpp"
#include "game_info.hpp"

class cScreen {
public :
    virtual int Run(sf::RenderWindow &App) = 0;
};

#endif //R_TYPE_CSCREEN_HPP
