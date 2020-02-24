//
// Created by hugo on 25/11/2019.
//

#include "include/screen_lobby.hpp"

screen_lobby::screen_lobby(game_info *gi, Music *music)
{
    _nbPlayer = 0;
    this->gameInfo = gi;
    _music = music;
}

int screen_lobby::Run(sf::RenderWindow &App)
{
    sf::Event Event{};
    bool Running = true;
    sf::Texture bg_texture = this->GetTexture("background");
    sf::Texture bg_black_texture = this->GetTexture("bg_black");
    sf::Texture ship_texture = this->GetTexture("ship_lobby");
    sf::Texture crown_texture = this->GetTexture("crown");
    sf::Sprite bg;
    sf::Sprite bg_lobby;
    sf::Sprite ship_lobby;
    sf::Sprite crown;
    sf::Text name_room;
    sf::Text waiting;
    sf::Text launch;
    sf::Font Font = this->GetFont("8bits");
    Player player;

    Sockets socketsMachine(gameInfo->_portRoom);

    bg.setTexture(bg_texture);

    bg_lobby.setTexture(bg_black_texture);
    bg_lobby.setPosition({160.f, 120.f});

    ship_lobby.setTexture(ship_texture);
    ship_lobby.setPosition({220.f, 190.f});

    crown.setTexture(crown_texture);
    crown.setPosition({165.f, 177.f});

    name_room.setFont(Font);
    name_room.setString(L"Room : my room");
    name_room.setCharacterSize(30);
    name_room.setPosition({165.f, 75.f});
    name_room.setFillColor(sf::Color(255, 255, 255));

    launch.setFont(Font);
    launch.setString(L"LAUNCH !");
    launch.setCharacterSize(30);
    launch.setPosition({725.f, 75.f});
    launch.setFillColor(sf::Color(255, 255, 255));

    waiting.setFont(Font);
    waiting.setString(L"Waiting players...");
    waiting.setCharacterSize(30);
    waiting.setPosition({390.f, 620.f});
    waiting.setFillColor(sf::Color(255, 255, 255));

    sf::Text player1;
    std::vector<std::string> resultPlayer1;
    player1.setFont(Font);
    player1.setCharacterSize(30);
    player1.setPosition({320.f, 185.f});
    player1.setFillColor(sf::Color(255, 255, 255));

    sf::Text player2;
    std::vector<std::string> resultPlayer2;
    player2.setFont(Font);
    player2.setCharacterSize(30);
    player2.setPosition({320.f, 290.f});
    player2.setFillColor(sf::Color(255, 255, 255));

    sf::Text player3;
    std::vector<std::string> resultPlayer3;
    player3.setFont(Font);
    player3.setCharacterSize(30);
    player3.setPosition({320.f, 400.f});
    player3.setFillColor(sf::Color(255, 255, 255));

    sf::Text player4;
    std::vector<std::string> resultPlayer4;
    player4.setFont(Font);
    player4.setCharacterSize(30);
    player4.setPosition({320.f, 500.f});
    player4.setFillColor(sf::Color(255, 255, 255));

    std::string playersNames;
    std::vector<std::string> result;
    std::vector<std::string> res;

    binaryProtocol BP;
    socketsMachine.Receiver();
    Player _player;

    while (Running) {
        if (!socketsMachine.structBuffer.isEmpty && socketsMachine.structBuffer.ope == 5 && _nbPlayer <= 4) {
            playersNames = socketsMachine.structBuffer.playerList;

            boost::split(result, playersNames, boost::is_any_of("\n"));
            for (int i = 0; i < result.size(); i++) {
                if (result[i].empty()) {
                    continue;
                }
                _nbPlayer = i + 1;
                boost::split(res, result[i], boost::is_any_of("|"));

                bool exist = false;
                for (auto &a : gameInfo->_playerList) {
                    if (a.id == std::stoi(res[0])) {
                        exist = true;
                    }
                }
                if (!exist) {
                    _player.id = std::stoi(res[0]);
                    _player.name = res[1];
                    _player.setPosition(0, 0);
                    gameInfo->_playerList.emplace_back(_player);
                }
            }
            BP.isEmpty = true;
            socketsMachine.structBuffer.isEmpty = true;

//            for (auto &a : gameInfo->_playerList) {
//                std::cout << a.id << std::endl;
//                std::cout << a.name << std::endl;
//            }
        } else {
            result.clear();
//            BP.ope = 5;
//            BP.isEmpty = false;
//            socketsMachine.Sender(BP, gameInfo->_ip, gameInfo->_portRoom);
        }

        while (App.pollEvent(Event)) {
            if (Event.type == sf::Event::Closed) {
                return (-1);
            }
            if (Event.type == sf::Event::MouseButtonPressed) {
                switch (Event.key.code) {
                    case sf::Mouse::Left:
                        if (launch.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
                            socketsMachine.socket.close();
                            socketsMachine.io_service.stop();
                            _music->stopMusic("ui");
                            return (2);
                        }
                    default:
                        break;
                }
            }
        }
        App.clear();
        App.draw(bg);
        App.draw(bg_lobby);
        App.draw(name_room);
        App.draw(launch);
        if (launch.getGlobalBounds().contains(sf::Mouse::getPosition(App).x, sf::Mouse::getPosition(App).y)) {
            launch.setFillColor(sf::Color(255, 0, 0));
        } else {
            launch.setFillColor(sf::Color(255, 255, 255));
        }

        if (_nbPlayer >= 1 && !result.empty()) {
            boost::split(resultPlayer1, result[0], boost::is_any_of("|"));
            player1.setString(resultPlayer1[1]);
        }
        if (_nbPlayer >= 2 && !result.empty()) {
            boost::split(resultPlayer2, result[1], boost::is_any_of("|"));
            player2.setString(resultPlayer2[1]);
        }
        if (_nbPlayer >= 3 && !result.empty()) {
            boost::split(resultPlayer3, result[2], boost::is_any_of("|"));
            player3.setString(resultPlayer3[1]);
        }
        if (_nbPlayer >= 4 && !result.empty()) {
            boost::split(resultPlayer4, result[3], boost::is_any_of("|"));
            player4.setString(resultPlayer4[1]);
        }
        App.draw(player1);
        App.draw(player2);
        App.draw(player3);
        App.draw(player4);
        App.draw(waiting);
        App.draw(ship_lobby);
        App.draw(crown);
        App.display();

        socketsMachine.io_service.poll();
    }
}

screen_lobby::~screen_lobby()
{
}