#include "include/screen.hpp"
#include "include/music.hpp"
#include <iostream>
int main() {

    std::vector<cScreen *> Screens;
    game_info gameInfo;
    Music music;
    int screen = 0;
    music.playMusic("ui");

    sf::RenderWindow window(sf::VideoMode(1024, 768, 32), "R-TYPE 2019", sf::Style::Titlebar | sf::Style::Close);

    screen_game s0;
    Screens.push_back(&s0);
    screen_menu s1(&gameInfo);
    Screens.push_back(&s1);
    screen_play s2(&gameInfo);
    Screens.push_back(&s2);
    screen_settings s3(&gameInfo, &music);
    Screens.push_back(&s3);
    screen_lobby s4(&gameInfo, &music);
    Screens.push_back(&s4);

    while (screen >= 0) {
        screen = Screens[screen]->Run(window);
    }


    return EXIT_SUCCESS;
}