//
// Created by hugo on 24/11/2019.
//

#include <iostream>
#include "include/screen_settings.hpp"

screen_settings::screen_settings(game_info *gi, Music *music)
{
    editHostname = true;
    editPort = false;
    editVolume = false;
    gameInfo = gi;
    _music = music;
}

int screen_settings::Run(sf::RenderWindow &App)
{
    sf::Event Event{};
    bool Running = true;
    sf::Texture bg_texture = this->GetTexture("background");
    sf::Texture input_texture = this->GetTexture("input");
    sf::Sprite bg;
    sf::Sprite title;
    sf::Sprite input_hostname;
    sf::Sprite input_port;
    sf::Sprite input_volume;
    sf::Font Font = this->GetFont("8bits");
    sf::Text hostname;
    sf::Text port;
    sf::Text volume;

    sf::Text save;
    sf::Text menu;

    sf::Text ht;
    sf::Text pt;
    sf::Text vol;
    std::string hostname_input = this->gameInfo->_ip;
    std::string port_input = std::to_string(this->gameInfo->_portRoom);
    //std::cout << port_input << "\n";
    int volume_input = _music->getVolume();

    bg.setTexture(bg_texture);

    hostname.setFont(Font);
    hostname.setString(L"Hostname :");
    hostname.setCharacterSize(30);
    hostname.setPosition({220.f, 70.f});
    hostname.setFillColor(sf::Color(255, 0, 0));

    input_hostname.setTexture(input_texture);
    input_hostname.setPosition({220.f, 120.f});

    port.setFont(Font);
    port.setString(L"Port :");
    port.setCharacterSize(30);
    port.setPosition({220.f, 270.f});
    port.setFillColor(sf::Color(255, 255, 255));

    input_port.setTexture(input_texture);
    input_port.setPosition({220.f, 320.f});

    volume.setFont(Font);
    volume.setString(L"Volume :");
    volume.setCharacterSize(30);
    volume.setPosition({220.f, 470.f});
    volume.setFillColor(sf::Color(255, 255, 255));

    input_volume.setTexture(input_texture);
    input_volume.setPosition({220.f, 520.f});

    ht.setFont(Font);
    ht.setCharacterSize(40);
    ht.setString(hostname_input);
    ht.setPosition({235.f, 145.f});
    ht.setFillColor(sf::Color(255, 255, 255));

    pt.setFont(Font);
    pt.setCharacterSize(40);
    pt.setString(port_input);
    pt.setPosition({235.f, 345.f});
    pt.setFillColor(sf::Color(255, 255, 255));

    vol.setFont(Font);
    vol.setString("<     " + std::to_string(volume_input) + "     >");
    vol.setCharacterSize(40);
    vol.setPosition({420.f, 545.f});
    vol.setFillColor(sf::Color(255, 255, 255));

    save.setFont(Font);
    save.setString(L"SAVE");
    save.setCharacterSize(40);
    save.setPosition({220.f, 670.f});
    save.setFillColor(sf::Color(255, 255, 255));

    menu.setFont(Font);
    menu.setString(L"MENU");
    menu.setCharacterSize(40);
    menu.setPosition({700.f, 670.f});
    menu.setFillColor(sf::Color(255, 255, 255));

    while (Running) {
        while (App.pollEvent(Event)) {
            if (Event.type == sf::Event::Closed) {
                return (-1);
            }
            if (Event.type == sf::Event::KeyPressed) {
                switch (Event.key.code) {
                    case sf::Keyboard::BackSpace:
                        if (editHostname) {
                            if (hostname_input.size() >= 1) {
                                hostname_input.erase(hostname_input.size() - 1, 1);
                                ht.setString(hostname_input);
                            }
                        }
                        if (editPort) {
                            if (port_input.size() >= 1) {
                                port_input.erase(port_input.size() - 1, 1);
                                pt.setString(port_input);
                            }
                        }
                    case sf::Keyboard::Right:
                        if (editVolume && volume_input <= 99 && Event.key.code == 72) {
                            volume_input++;
                            vol.setString("<     " + std::to_string(volume_input) + "     >");
                        }
                    case sf::Keyboard::Left:
                        if (editVolume && volume_input >= 1 && Event.key.code == 71) {
                            volume_input--;
                            vol.setString("<     " + std::to_string(volume_input) + "     >");
                        }
                    default:
                        break;
                }
            }
            if (Event.type == sf::Event::TextEntered) {
                if (editHostname) {
                    if (Event.text.unicode < 128 && hostname_input.size() <= 20) {
                        if (Event.text.unicode != '\b') {
                            hostname_input += static_cast<char>(Event.text.unicode);
                            ht.setString(hostname_input);
                        }
                    }
                }
                if (editPort) {
                    if (Event.text.unicode < 128 && port_input.size() <= 3) {
                        if (Event.text.unicode != '\b') {
                            port_input += static_cast<char>(Event.text.unicode);
                            pt.setString(port_input);
                        }
                    }
                }
            }
            if (Event.type == sf::Event::MouseButtonPressed) {
                switch (Event.key.code) {
                    case sf::Mouse::Left:
                        if (input_hostname.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            editPort = false;
                            editVolume = false;
                            editHostname = true;
                            hostname.setFillColor(sf::Color(255, 0, 0));
                            port.setFillColor(sf::Color(255, 255, 255));
                            volume.setFillColor(sf::Color(255, 255, 255));
                        }
                        if (input_port.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            editHostname = false;
                            editVolume = false;
                            editPort = true;
                            port.setFillColor(sf::Color(255, 0, 0));
                            hostname.setFillColor(sf::Color(255, 255, 255));
                            volume.setFillColor(sf::Color(255, 255, 255));
                        }
                        if (input_volume.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            editHostname = false;
                            editPort = false;
                            editVolume = true;
                            volume.setFillColor(sf::Color(255, 0, 0));
                            hostname.setFillColor(sf::Color(255, 255, 255));
                            port.setFillColor(sf::Color(255, 255, 255));
                        }
                        if (menu.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            return (1);
                        }
                        if (save.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            this->gameInfo->_ip = hostname_input;
                            this->gameInfo->_portRoom = std::stoi(port_input);
                            _music->setVolume(volume_input);
                        }
                    default:
                        break;
                }
            }
        }

        App.clear();
        App.draw(bg);
        App.draw(hostname);
        App.draw(input_hostname);
        App.draw(port);
        App.draw(input_port);
        App.draw(volume);
        App.draw(input_volume);
        App.draw(ht);
        App.draw(pt);
        App.draw(vol);
        App.draw(save);
        if (save.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
            save.setFillColor(sf::Color(255, 0, 0));
        } else {
            save.setFillColor(sf::Color(255, 255, 255));
        }
        App.draw(menu);
        if (menu.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
            menu.setFillColor(sf::Color(255, 0, 0));
        } else {
            menu.setFillColor(sf::Color(255, 255, 255));
        }
        App.display();
    }
}

screen_settings::~screen_settings() {
}