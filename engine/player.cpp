//
// Created by hugo on 26/11/2019.
//

#include "include/player.hpp"
#include "include/assets_manager.hpp"

Player::Player()
{
}

void Player::move(sf::Vector2f direction)
{
    _player.move(direction);
}

int Player::getPositionX()
{
    return _player.getPosition().x;
}

int Player::getPositionY()
{
    return _player.getPosition().y;
}

void Player::setPosition(int x, int y)
{
    _player.setPosition(x, y);
}

void Player::draw(sf::RenderWindow &App, std::string texture)
{
    sf::Texture ship = this->GetTexture(texture);
    _player.setTexture(ship);
    App.draw(_player);
}

Player::~Player()
{
}