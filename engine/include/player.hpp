//
// Created by hugo on 26/11/2019.
//

#ifndef R_TYPE_PLAYER_HPP
#define R_TYPE_PLAYER_HPP

#include "SFML/Graphics.hpp"
#include "assets_manager.hpp"

class Player : public AssetsManager {
public:
    Player();
    ~Player();

    void move(sf::Vector2f direction);
    int getPositionX();
    int getPositionY();
    void setPosition(int x, int y);
    void draw(sf::RenderWindow &App, std::string texture);
    int x;
    int y;
    int id;
    std::string name;
private:
    sf::Sprite _player;
};

#endif //R_TYPE_PLAYER_HPP
