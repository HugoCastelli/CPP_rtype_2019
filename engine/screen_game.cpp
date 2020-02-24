//
// Created by hugo on 23/11/2019.
//

#include <iostream>
#include "include/screen_game.hpp"

screen_game::screen_game()
{
    alpha_max = 3 * 255;
    alpha_div = 3;
    playing = false;
}

int screen_game::Run(sf::RenderWindow &App)
{
    sf::Event Event{};
    bool Running = true;
    sf::Texture bg_texture = this->GetTexture("background");
    sf::Texture TextureGame1 = this->GetTexture("game_1");
    sf::Texture TextureGame2 = this->GetTexture("game_2");
    sf::Texture TextureGame3 = this->GetTexture("game_3");
    sf::Sprite bg;
    sf::Sprite game1;
    sf::Sprite game2;
    sf::Sprite game3;
    int alpha = 0;


    bg.setTexture(bg_texture);
    bg.setColor(sf::Color(255, 255, 255, alpha));
    game1.setTexture(TextureGame1);
    game1.setPosition({350.f, 200.f});
    game2.setTexture(TextureGame2);
    game2.setPosition({350.f, 350.f});
    game3.setTexture(TextureGame3);
    game3.setPosition({350.f, 500.f});

    if (playing) {
        alpha = alpha_max;
    }

    while (Running) {
        while (App.pollEvent(Event)) {
            if (Event.type == sf::Event::Closed) {
                return (-1);
            }
            if (Event.type == sf::Event::KeyPressed) {
                switch (Event.key.code) {
                    case sf::Keyboard::Up:
                        break;
                    case sf::Keyboard::Down:
                        break;
                    default:
                        break;
                }
            }
            if (Event.type == sf::Event::MouseButtonPressed) {
                switch (Event.key.code) {
                    case sf::Mouse::Left:
                        if (game1.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            return (1);
                        }
                        break;
                    default:
                        break;
                }
            }
        }
        if (alpha < alpha_max) {
            alpha++;
        }
        bg.setColor(sf::Color(255, 255, 255, alpha / alpha_div));
        App.clear();
        App.draw(bg);

        if (alpha == alpha_max) {
            App.draw(game1);
            App.draw(game2);
            App.draw(game3);
        }
        App.display();
    }
    return (-1);
}

screen_game::~screen_game() {
}