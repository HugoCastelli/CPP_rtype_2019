//
// Created by hugo on 26/11/2019.
//

#ifndef R_TYPE_ENEMY_HPP
#define R_TYPE_ENEMY_HPP

#include "SFML/Graphics.hpp"
#include "bullet.hpp"

class Enemy : public AssetsManager{
public:
    Enemy();
    ~Enemy();

    void setPosition(int, int);
    void getCollision(Bullet bullet);
    void draw(sf::RenderWindow &App, std::string texture);
    int posX;
    int posY;
    int speed;
    int enemyId;
    bool isKilled;

public:
    sf::Sprite _enemy;
};

#endif //R_TYPE_ENEMY_HPP
