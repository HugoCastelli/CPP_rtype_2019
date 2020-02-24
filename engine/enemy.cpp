//
// Created by hugo on 26/11/2019.
//

#include "include/enemy.hpp"

Enemy::Enemy()
{
    isKilled = false;
}

void Enemy::setPosition(int x, int y)
{
    _enemy.setPosition(x, y);
}

void Enemy::getCollision(Bullet bullet)
{
}

void Enemy::draw(sf::RenderWindow &App, std::string texture)
{
    sf::Texture ship = this->GetTexture(texture);
    _enemy.setTexture(ship);
    App.draw(_enemy);
}

Enemy::~Enemy()
{
}