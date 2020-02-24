//
// Created by hugo on 24/11/2019.
//

#ifndef R_TYPE_SCREEN_PLAY_HPP
#define R_TYPE_SCREEN_PLAY_HPP

#include "cScreen.hpp"
#include "assets_manager.hpp"
#include "bullet.hpp"
#include "enemy.hpp"
#include "player.hpp"
#include "sounds.hpp"
#include "music.hpp"
#include <ctime>

class screen_play : public cScreen, public AssetsManager, public Sound, public Music {
public:
    screen_play(game_info *gi);
    ~screen_play();
    virtual int Run(sf::RenderWindow &App);
    void getCollision(Bullet bullet, std::list<sf::Sprite>::iterator it);
    game_info *gameInfo;

private:
    bool _startGame;
};

#endif //R_TYPE_SCREEN_PLAY_H
