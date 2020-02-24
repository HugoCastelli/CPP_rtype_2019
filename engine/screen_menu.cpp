//
// Created by hugo on 23/11/2019.
//

#include <iostream>
#include <string>
#include "include/screen_menu.hpp"

screen_menu::screen_menu(game_info *gi)
{
    _setNext = false;
    _setPlay = false;
    _setCreateRoom = false;
    _timeout = false;
    _nbRoom = 0;
    _refresh = false;
    gameInfo = gi;
}

int screen_menu::connectToRoom(std::vector<std::string> port, std::string playerName)
{
    Player _player;
    Sockets socketsMachine(std::stoi(port[1]));
    binaryProtocol BP;
    BP.ope = 3;
    BP.isEmpty = false;
    std::strcpy(BP.playerName, playerName.c_str());
    socketsMachine.Sender(BP, gameInfo->_ip, std::stoi(port[1]));
    socketsMachine.WaitResponse(&socketsMachine);
    _player.name = playerName;
    _player.id = socketsMachine.structBuffer.playerID;
    _player.setPosition(0, 0);
    gameInfo->_actualPlayerID = socketsMachine.structBuffer.playerID;
    gameInfo->_playerList.emplace_back(_player);
    gameInfo->_portRoom = socketsMachine.structBuffer.port;
    gameInfo->_nameRoom = socketsMachine.structBuffer.roomName;
    socketsMachine.structBuffer.isEmpty = true;
    return(4);
}

int screen_menu::Run(sf::RenderWindow &App)
{
    sf::Event Event{};
    bool Running = true;

    sf::Texture bg_texture = this->GetTexture("background");
    sf::Texture title_texture = this->GetTexture("title_rtype");
    sf::Texture input_texture = this->GetTexture("input");
    sf::Texture bg_black_texture = this->GetTexture("bg_black");
    sf::Texture bg_modal_texture = this->GetTexture("bg_modal");
    sf::Texture signal_texture = this->GetTexture("signal");
    sf::Font Font = this->GetFont("8bits");
    sf::Sprite bg;
    sf::Sprite title;
    sf::Sprite earth;
    sf::Sprite input;
    sf::Sprite bg_black;
    sf::Text nickname;
    sf::Text text;
    sf::Text next;
    sf::Text play;
    sf::Text refresh;
    sf::Text settings;
    sf::Text exit;

    sf::Text back;
    sf::Text create_room;
    sf::Text room;
    std::string str;

    std::string name_room;
    sf::Sprite bg_modal;
    sf::Sprite modal_input;
    sf::Text create;
    sf::Text room_name;
    sf::Text nickname_room;

    bg.setTexture(bg_texture);

    bg_modal.setTexture(bg_modal_texture);
    modal_input.setTexture(input_texture);
    modal_input.setPosition({220.f, 300.f});
    create.setFont(Font);
    create.setString(L"CREATE");
    create.setCharacterSize(40);
    create.setPosition({430.f, 450.f});
    create.setFillColor(sf::Color(255, 255, 255));
    room_name.setFont(Font);
    room_name.setString(L"Room name :");
    room_name.setCharacterSize(40);
    room_name.setPosition({220.f, 230.f});
    room_name.setFillColor(sf::Color(255, 255, 255));
    nickname_room.setFont(Font);
    nickname_room.setCharacterSize(40);
    nickname_room.setPosition({235.f, 325.f});
    nickname_room.setFillColor(sf::Color(255, 255, 255));

    title.setTexture(title_texture);
    title.setPosition({350.f, 100.f});

    bg_black.setTexture(bg_black_texture);
    bg_black.setPosition({300.f, 130.f});

    play.setFont(Font);
    play.setString(L"PLAY");
    play.setCharacterSize(40);
    play.setPosition({470.f, 300.f});
    play.setFillColor(sf::Color(255, 255, 255));

    settings.setFont(Font);
    settings.setString(L"SETTINGS");
    settings.setCharacterSize(40);
    settings.setPosition({420.f, 480.f});
    settings.setFillColor(sf::Color(255, 255, 255));

    exit.setFont(Font);
    exit.setString(L"EXIT");
    exit.setCharacterSize(40);
    exit.setPosition({470.f, 650.f});
    exit.setFillColor(sf::Color(255, 255, 255));

    input.setTexture(input_texture);
    input.setPosition({220.f, 420.f});

    nickname.setFont(Font);
    nickname.setCharacterSize(40);
    nickname.setPosition({235.f, 445.f});
    nickname.setFillColor(sf::Color(255, 255, 255));

    text.setFont(Font);
    text.setString(L"Nickname :");
    text.setCharacterSize(30);
    text.setPosition({220.f, 360.f});
    text.setFillColor(sf::Color(255, 255, 255));

    next.setFont(Font);
    next.setString(L"Next");
    next.setCharacterSize(40);
    next.setPosition({470.f, 600.f});
    next.setFillColor(sf::Color(255, 255, 255));

    create_room.setFont(Font);
    create_room.setString(L"Create room");
    create_room.setCharacterSize(40);
    create_room.setPosition({20.f, 200.f});
    create_room.setFillColor(sf::Color(255, 255, 255));

    back.setFont(Font);
    back.setString(L"Back");
    back.setCharacterSize(40);
    back.setPosition({20.f, 320.f});
    back.setFillColor(sf::Color(255, 255, 255));

    refresh.setFont(Font);
    refresh.setString(L"Refresh");
    refresh.setCharacterSize(40);
    refresh.setPosition({20.f, 260.f});
    refresh.setFillColor(sf::Color(255, 255, 255));

    room.setFont(Font);
    room.setString(L"Room available");
    room.setCharacterSize(40);
    room.setPosition({510.f, 60.f});
    room.setFillColor(sf::Color(255, 255, 255));

    sf::Text room1;
    std::vector<std::string> result1;
    sf::Sprite room1_signal;
    room1_signal.setTexture(signal_texture);
    room1_signal.setPosition({950.f, 150.f});
    room1.setFont(Font);
    room1.setCharacterSize(30);
    room1.setPosition({320.f, 150.f});
    room1.setFillColor(sf::Color(255, 255, 255));

    sf::Text room2;
    std::vector<std::string> result2;
    sf::Sprite room2_signal;
    room2_signal.setTexture(signal_texture);
    room2_signal.setPosition({950.f, 200.f});
    room2.setFont(Font);
    room2.setCharacterSize(30);
    room2.setPosition({320.f, 200.f});
    room2.setFillColor(sf::Color(255, 255, 255));

    sf::Text room3;
    std::vector<std::string> result3;
    sf::Sprite room3_signal;
    room3_signal.setTexture(signal_texture);
    room3_signal.setPosition({950.f, 250.f});
    room3.setFont(Font);
    room3.setCharacterSize(30);
    room3.setPosition({320.f, 250.f});
    room3.setFillColor(sf::Color(255, 255, 255));

    sf::Text room4;
    std::vector<std::string> result4;
    sf::Sprite room4_signal;
    room4_signal.setTexture(signal_texture);
    room4_signal.setPosition({950.f, 300.f});
    room4.setFont(Font);
    room4.setCharacterSize(30);
    room4.setPosition({320.f, 300.f});
    room4.setFillColor(sf::Color(255, 255, 255));

    sf::Text room5;
    std::vector<std::string> result5;
    sf::Sprite room5_signal;
    room5_signal.setTexture(signal_texture);
    room5_signal.setPosition({950.f, 350.f});
    room5.setFont(Font);
    room5.setCharacterSize(30);
    room5.setPosition({320.f, 350.f});
    room5.setFillColor(sf::Color(255, 255, 255));

    sf::Text room6;
    std::vector<std::string> result6;
    sf::Sprite room6_signal;
    room6_signal.setTexture(signal_texture);
    room6_signal.setPosition({950.f, 400.f});
    room6.setFont(Font);
    room6.setCharacterSize(30);
    room6.setPosition({320.f, 400.f});
    room6.setFillColor(sf::Color(255, 255, 255));

    sf::Text room7;
    std::vector<std::string> result7;
    sf::Sprite room7_signal;
    room7_signal.setTexture(signal_texture);
    room7_signal.setPosition({950.f, 450.f});
    room7.setFont(Font);
    room7.setCharacterSize(30);
    room7.setPosition({320.f, 450.f});
    room7.setFillColor(sf::Color(255, 255, 255));

    sf::Text room8;
    std::vector<std::string> result8;
    sf::Sprite room8_signal;
    room8_signal.setTexture(signal_texture);
    room8_signal.setPosition({950.f, 500.f});
    room8.setFont(Font);
    room8.setCharacterSize(30);
    room8.setPosition({320.f, 500.f});
    room8.setFillColor(sf::Color(255, 255, 255));

    sf::Text room9;
    std::vector<std::string> result9;
    sf::Sprite room9_signal;
    room9_signal.setTexture(signal_texture);
    room9_signal.setPosition({950.f, 550.f});
    room9.setFont(Font);
    room9.setCharacterSize(30);
    room9.setPosition({320.f, 550.f});
    room9.setFillColor(sf::Color(255, 255, 255));

    sf::Text room10;
    std::vector<std::string> result10;
    sf::Sprite room10_signal;
    room10_signal.setTexture(signal_texture);
    room10_signal.setPosition({950.f, 600.f});
    room10.setFont(Font);
    room10.setCharacterSize(30);
    room10.setPosition({320.f, 600.f});
    room10.setFillColor(sf::Color(255, 255, 255));
    int port = 4242;
    Sockets socketsMachine(port);
    std::vector<std::string> splitted;
    std::vector<std::string> result;
    Player _player;
    binaryProtocol BP;

    while (Running) {
        while (App.pollEvent(Event)) {
            if (Event.type == sf::Event::Closed) {
                return (-1);
            }
            if (Event.type == sf::Event::KeyPressed) {
                switch (Event.key.code) {
                    case sf::Keyboard::BackSpace:
                        if (str.size() >= 1) {
                            str.erase(str.size() - 1, 1);
                            nickname.setString(str);
                        }
                        if (_setCreateRoom) {
                            if (name_room.size() >= 1) {
                                name_room.erase(name_room.size() - 1, 1);
                                nickname_room.setString(name_room);
                            }
                        }
                    default:
                        break;
                }
            }
            if (Event.type == sf::Event::TextEntered) {
                if (_setCreateRoom) {
                    if (Event.text.unicode < 128 && name_room.size() <= 20) {
                        if (Event.text.unicode != '\b') {
                            name_room += static_cast<char>(Event.text.unicode);
                            nickname_room.setString(name_room);
                        }
                    }
                } else {
                    if (Event.text.unicode < 128 && str.size() <= 20) {
                        if (Event.text.unicode != '\b') {
                            str += static_cast<char>(Event.text.unicode);
                            nickname.setString(str);
                        }
                    }
                }
            }
            if (Event.type == sf::Event::MouseButtonPressed) {
                switch (Event.key.code) {
                    case sf::Mouse::Left:
                        if (!_setCreateRoom) {
                            if (next.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                _setNext = true;
                            }
                            if (play.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                _setPlay = true;
                            }
                            if (exit.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return (-1);
                            }
                            if (back.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                _setPlay = false;
                            }
                            if (settings.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return (3);
                            }
                            if (create_room.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                _setCreateRoom = true;
                            }


                            if (room1.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result1, str);
                            }
                            if (room2.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result2, str);
                            }
                            if (room3.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result3, str);
                            }
                            if (room4.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result4, str);
                            }
                            if (room5.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result5, str);
                            }
                            if (room6.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result6, str);
                            }
                            if (room7.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result7, str);
                            }
                            if (room8.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result8, str);
                            }
                            if (room9.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result9, str);
                            }
                            if (room10.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                                return connectToRoom(result10, str);
                            }
                        }
                        if (refresh.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            BP.ope = 1;
                            BP.isEmpty = false;
                            socketsMachine.Sender(BP, gameInfo->_ip, 4242);
                            socketsMachine.WaitResponse(&socketsMachine);
                            boost::split(result, socketsMachine.structBuffer.roomList, boost::is_any_of("\n"));
                            for (int i = 0; i < result.size(); i++)
                                _nbRoom = i;
                            socketsMachine.structBuffer.isEmpty = true;
                            _refresh = true;
                        }
                        if (create.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            BP.ope = 0;
                            BP.isEmpty = false;
                            std::strcpy(BP.roomName, name_room.c_str());
                            std::strcpy(BP.playerName, str.c_str());
                            socketsMachine.Sender(BP, gameInfo->_ip, 4242);
                            socketsMachine.WaitResponse(&socketsMachine);
                            _player.name = str;
                            _player.id = 0;
                            _player.setPosition(0, 0);
                            gameInfo->_actualPlayerID = 0;
                            gameInfo->_playerList.emplace_back(_player);
                            gameInfo->_portRoom = socketsMachine.structBuffer.port;
                            gameInfo->_nameRoom = name_room;
                            socketsMachine.structBuffer.isEmpty = true;
                            return (4);
                        }
                    default:
                        break;
                }
            }
        }
        App.clear();
        App.draw(bg);
        if (!_setNext) {
            App.draw(title);
            App.draw(input);
            App.draw(nickname);
            App.draw(text);
            if (str.length() >= 1) {
                App.draw(next);
                if (next.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                    next.setFillColor(sf::Color(255, 0, 0));
                } else {
                    next.setFillColor(sf::Color(255, 255, 255));
                }
            }
        } else {
            if (!_setPlay) {
                App.draw(title);
                App.draw(play);
                if (play.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                    play.setFillColor(sf::Color(255, 0, 0));
                } else {
                    play.setFillColor(sf::Color(255, 255, 255));
                }
                App.draw(settings);
                if (settings.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                    settings.setFillColor(sf::Color(255, 0, 0));
                } else {
                    settings.setFillColor(sf::Color(255, 255, 255));
                }
                App.draw(exit);
                if (exit.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                    exit.setFillColor(sf::Color(255, 0, 0));
                } else {
                    exit.setFillColor(sf::Color(255, 255, 255));
                }
            } else {
                App.draw(bg_black);
                App.draw(refresh);
                if (refresh.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                    refresh.setFillColor(sf::Color(255, 0, 0));
                } else {
                    refresh.setFillColor(sf::Color(255, 255, 255));
                }
                App.draw(back);
                if (back.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                    back.setFillColor(sf::Color(255, 0, 0));
                } else {
                    back.setFillColor(sf::Color(255, 255, 255));
                }
                App.draw(create_room);
                if (create_room.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                    create_room.setFillColor(sf::Color(255, 0, 0));
                } else {
                    create_room.setFillColor(sf::Color(255, 255, 255));
                }
                App.draw(room);
                if (_refresh) {
                    if (_nbRoom >= 1) {
                        boost::split(result1, result[0], boost::is_any_of("|"));
                        room1.setString(result1[0]);
                        App.draw(room1);
                        App.draw(room1_signal);
                        if (room1.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room1.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room1.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                    if (_nbRoom >= 2) {
                        boost::split(result2, result[1], boost::is_any_of("|"));
                        room2.setString(result2[0]);
                        App.draw(room2);
                        App.draw(room2_signal);
                        if (room2.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room2.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room2.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                    if (_nbRoom >= 3) {
                        boost::split(result3, result[2], boost::is_any_of("|"));
                        room3.setString(result3[0]);
                        App.draw(room3);
                        App.draw(room3_signal);
                        if (room3.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room3.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room3.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                    if (_nbRoom >= 4) {
                        boost::split(result4, result[3], boost::is_any_of("|"));
                        room4.setString(result4[0]);
                        App.draw(room4);
                        App.draw(room4_signal);
                        if (room4.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room4.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room4.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                    if (_nbRoom >= 5) {
                        boost::split(result5, result[4], boost::is_any_of("|"));
                        room5.setString(result5[0]);
                        App.draw(room5);
                        App.draw(room5_signal);
                        if (room5.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room5.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room5.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                    if (_nbRoom >= 6) {
                        boost::split(result6, result[5], boost::is_any_of("|"));
                        room6.setString(result6[0]);
                        App.draw(room6);
                        if (room6.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room6.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room6.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                    if (_nbRoom >= 7) {
                        boost::split(result7, result[6], boost::is_any_of("|"));
                        room7.setString(result7[0]);
                        App.draw(room7);
                        App.draw(room6_signal);
                        if (room7.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room7.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room7.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                    if (_nbRoom >= 8) {
                        boost::split(result8, result[7], boost::is_any_of("|"));
                        room8.setString(result8[0]);
                        App.draw(room8);
                        App.draw(room8_signal);
                        if (room8.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room8.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room8.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                    if (_nbRoom >= 9) {
                        boost::split(result9, result[8], boost::is_any_of("|"));
                        room9.setString(result9[0]);
                        App.draw(room9);
                        App.draw(room9_signal);
                        if (room9.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room9.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room9.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                    if (_nbRoom == 10) {
                        boost::split(result10, result[9], boost::is_any_of("|"));
                        room10.setString(result10[0]);
                        App.draw(room10);
                        App.draw(room10_signal);
                        if (room10.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            room10.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            room10.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                }
                if (_setCreateRoom) {
                    App.draw(bg_modal);
                    App.draw(modal_input);
                    App.draw(room_name);
                    App.draw(nickname_room);
                    if (name_room.size() >= 1) {
                        App.draw(create);
                        if (create.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            create.setFillColor(sf::Color(255, 0, 0));
                        } else {
                            create.setFillColor(sf::Color(255, 255, 255));
                        }
                    }
                }
            }
        }
        App.display();
    }
    return (-1);
}

screen_menu::~screen_menu()
{
}