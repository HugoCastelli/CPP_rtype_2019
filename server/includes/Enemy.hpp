//
// Created by lepipotron on 01/12/2019.
//

#ifndef R_TYPE_ENEMY_HPP
#define R_TYPE_ENEMY_HPP

class Enemy {
public:
    Enemy() = default;
    virtual ~Enemy() = default;

    int speed;
    int posX;
    int posY;
    int id;
};

#endif //R_TYPE_ENEMY_HPP
