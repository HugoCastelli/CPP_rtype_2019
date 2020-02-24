//
// Created by hugo on 26/11/2019.
//

#include "include/bullet.hpp"

Bullet::Bullet(sf::Vector2f size)
{
}

void Bullet::fire(int speed) {
    _bullet.move(speed, 0);
    x += speed;
}


void Bullet::setPosition(int x, int y)
{
    _bullet.setPosition(x, y);
}

int Bullet::fireTop()
{
    return _bullet.getPosition().y;
}

int Bullet::fireRight()
{
    return _bullet.getPosition().x + _bullet.getScale().x;
}

int Bullet::fireLeft()
{
    return _bullet.getPosition().x;
}

int Bullet::fireBottom()
{
    return _bullet.getPosition().y + _bullet.getScale().y;
}

void Bullet::draw(sf::RenderWindow &App, std::string texture)
{
    sf::Texture bullet_tex = this->GetTexture(texture);
    _bullet.setTexture(bullet_tex);
    App.draw(_bullet);
}

