//
// Created by hugo on 26/11/2019.
//

#ifndef R_TYPE_BULLET_HPP
#define R_TYPE_BULLET_HPP

#include "SFML/Graphics.hpp"
#include "cScreen.hpp"
#include "assets_manager.hpp"

class Bullet : public AssetsManager {
public:
    Bullet(sf::Vector2f size);
    ~Bullet()=default;

    void fire(int speed);
    int fireTop();
    int fireRight();
    int fireLeft();
    int fireBottom();
    void draw(sf::RenderWindow &App, std::string texture);
    void setPosition(int, int);
    int x;
    int y;
public:
    sf::Sprite _bullet;
};

#endif //R_TYPE_BULLET_HPP
