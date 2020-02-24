//
// Created by hugo on 24/11/2019.
//

#include "include/screen_play.hpp"

#define         PLAYER_SPEED        5
#define         BULLET_SPEED        20
#define         ENEMY_SPEED         3

screen_play::screen_play(game_info *gi)
{
    gameInfo = gi;
    _startGame = false;
}

void screen_play::getCollision(class Bullet bullet, std::list<sf::Sprite>::iterator it)
{
    if (bullet.fireRight() > it->getPosition().x && bullet.fireTop() < it->getPosition().y
        && bullet.fireBottom() > it->getPosition().y) {
    }
}

int screen_play::Run(sf::RenderWindow &App)
{
    sf::Event Event{};
    bool Running = true;
    sf::Texture bg_texture = this->GetTexture("bg_para");
	sf::Texture earth_texture = this->GetTexture("earth");
	sf::Texture venus_texture = this->GetTexture("venus");
	sf::Texture mars_texture = this->GetTexture("mars");
	sf::Texture saturne_texture = this->GetTexture("saturne");
	sf::Texture sun_texture = this->GetTexture("sun");
    sf::Sprite bg;
	sf::Sprite earth;
	sf::Sprite venus;
	sf::Sprite mars;
	sf::Sprite saturne;
	sf::Sprite sun;
	Sound fire_ship;
    Music music;

    music.playMusic("play");
    sf::Sprite EnemySprite;
    EnemySprite.setTexture(this->GetTexture("ship_blue"));
    int line_1 = 15;
    int nb_wave_1 = 2;
    for(int i = 0; i < line_1; i++) {
        for(int j = 0; j < nb_wave_1; j++) {
            EnemySprite.setPosition((j*100) + 1000, (i*64) + 20);
        }
    }

    App.setVerticalSyncEnabled(true);
    App.setKeyRepeatEnabled(false);
    Player player1;
    std::vector<Bullet> bullet;
    bg_texture.setSmooth(true);
    bg_texture.setRepeated(true);
    float bgX;
    float bgSpeed;
    float Time;
	float planetY;
	float planetX;
	float planet_speed;
	sf::Time elapsedTime;
	int i;

	srand((unsigned)time(0));
	earth.setTexture(earth_texture);
	venus.setTexture(venus_texture);
	mars.setTexture(mars_texture);
	saturne.setTexture(saturne_texture);
	sun.setTexture(sun_texture);
	planet_speed = 100;
	earth.setPosition(planetX, planetY);
	venus.setPosition(planetX, planetY);
	mars.setPosition(planetX, planetY);
	saturne.setPosition(planetX, planetY);
	sun.setPosition(planetX, planetY);

    bg.setTexture(bg_texture);
    bg.setPosition(0, 0);
    bgX = 0;
    bgSpeed = 0.1;
    Time = 8;
    bg.setTextureRect(sf::IntRect(bgX, 0, 1024, 968));


    sf::Text welcome;
    welcome.setFont(this->GetFont("8bits"));
    welcome.setCharacterSize(40);
    welcome.setString(L"Game start in...");
    welcome.setPosition({340.f, 300.f});
    welcome.setFillColor(sf::Color(255, 255, 255));

    sf::Text compteur;
    compteur.setFont(this->GetFont("8bits"));
    compteur.setCharacterSize(40);
    compteur.setPosition({650.f, 300.f});
    compteur.setFillColor(sf::Color(255, 255, 255));
    sf::Sprite heart1;
    heart1.setPosition(10, 10);
    heart1.setTexture(this->GetTexture("heart"));
    sf::Sprite heart2;
    heart2.setPosition(40, 10);
    heart2.setTexture(this->GetTexture("heart"));
    sf::Sprite heart3;
    heart3.setPosition(70, 10);
    heart3.setTexture(this->GetTexture("heart"));
    sf::Text stage;
    stage.setFont(this->GetFont("8bits"));
    stage.setCharacterSize(20);
    stage.setString(L"Stage A : In progress....");
    stage.setPosition(100, 6);
    stage.setFillColor(sf::Color(255, 255, 255));

    bool upFlag = false;
    bool downFlag = false;
    bool leftFlag = false;
    bool rightFlag = false;
    bool fire = false;

	sf::Clock clock;
	sf::Clock clock1;

    Sockets socketsMachine(gameInfo->_portRoom);
    std::vector<std::string> splitted;
    std::string playersPositions;
    std::string enemyPositions;
    socketsMachine.Receiver();
    binaryProtocol BP;
    std::vector<std::string> result;
    std::vector<std::string> res;

    std::vector<Enemy> EnemyList;

    for (int i = 0; i <= gameInfo->wave * 5; i++) {
        Enemy enemy;
        enemy.posX = 1200;
        enemy.posY = 500;
        enemy.speed = ENEMY_SPEED;
        enemy.enemyId = i;
        EnemyList.push_back(enemy);
    }

    for (auto &i : EnemyList) {
        BP.ope = 9;
        BP.isEmpty = false;
        BP.enemyPosX = i.posX;
        BP.enemyPosY = i.posY;
        BP.enemySpeed = i.speed;
        BP.enemyID = i.enemyId;
        socketsMachine.Sender(BP, gameInfo->_ip, gameInfo->_portRoom);
        socketsMachine.structBuffer.isEmpty = true;
    }

    while (Running) {
		bool animate = false;
		sf::Time spawn = clock.getElapsedTime();
		if (spawn.asSeconds() > 28) {
            clock.restart();
            animate = true;
        }
        while (App.pollEvent(Event)) {
            if (Event.type == sf::Event::Closed) {
                return (-1);
            }
            if (Event.type == sf::Event::KeyPressed) {
                switch (Event.key.code) {
                    case sf::Keyboard::Z:
                        upFlag = true;
                        break;
                    case sf::Keyboard::S:
                        downFlag = true;
                        break;
                    case sf::Keyboard::Q:
                        leftFlag = true;
                        break;
                    case sf::Keyboard::D:
                        rightFlag = true;
                        break;
                    case sf::Keyboard::Space:
                        fire = true;
                        break;
                    default:
                        break;
                }
            }
            if (Event.type == sf::Event::KeyReleased) {
                switch (Event.key.code) {
                    case sf::Keyboard::Z:
                        upFlag = false;
                        break;
                    case sf::Keyboard::S:
                        downFlag = false;
                        break;
                    case sf::Keyboard::Q:
                        leftFlag = false;
                        break;
                    case sf::Keyboard::D:
                        rightFlag = false;
                        break;
                    default :
                        break;
                }
            }
        }
        if (leftFlag) {
            BP.ope = 4;
            BP.isEmpty = false;
            BP.playerID = gameInfo->_actualPlayerID;
            BP.speed = PLAYER_SPEED;
            std::string move = "MOVELEFT";
            std::strcpy(BP.movementDir, move.c_str());
            socketsMachine.Sender(BP, gameInfo->_ip, gameInfo->_portRoom);
            socketsMachine.structBuffer.isEmpty = true;
        }
        if (rightFlag) {
            BP.ope = 4;
            BP.isEmpty = false;
            BP.playerID = gameInfo->_actualPlayerID;
            BP.speed = PLAYER_SPEED;
            std::strcpy(BP.movementDir, "MOVERIGHT");
            socketsMachine.Sender(BP, gameInfo->_ip, gameInfo->_portRoom);
            socketsMachine.structBuffer.isEmpty = true;
        }
        if (upFlag) {
            BP.ope = 4;
            BP.isEmpty = false;
            BP.playerID = gameInfo->_actualPlayerID;
            BP.speed = PLAYER_SPEED;
            std::strcpy(BP.movementDir, "MOVEUP");
            socketsMachine.Sender(BP, gameInfo->_ip, gameInfo->_portRoom);
            socketsMachine.structBuffer.isEmpty = true;
        }
        if (downFlag) {
            BP.ope = 4;
            BP.isEmpty = false;
            BP.playerID = gameInfo->_actualPlayerID;
            BP.speed = PLAYER_SPEED;
            std::strcpy(BP.movementDir, "MOVEDOWN");
            socketsMachine.Sender(BP, gameInfo->_ip, gameInfo->_portRoom);
            socketsMachine.structBuffer.isEmpty = true;
        }

        if (bgX < 1024) {
            bgX += bgSpeed * Time;
        } else {
            bgX = 0;
        }
        bg.setTextureRect(sf::IntRect(bgX, 0, 1024, 968));
        App.clear();
        App.draw(bg);
		if (animate == true) {
			i = (rand()%5)+1;
			planetX = 1024;
			planetY = (rand()%580)+1;
		}
			if (i == 1) {
				earth.setPosition(sf::Vector2f(--planetX + planet_speed, planetY));
				App.draw(earth);
			}
			else if (i == 2) {
				venus.setPosition(sf::Vector2f(--planetX + planet_speed, planetY));
				App.draw(venus);
			}
			else if (i == 3) {
				mars.setPosition(sf::Vector2f(--planetX + planet_speed, planetY));
				App.draw(mars);
			}
			else if (i == 4) {
				saturne.setPosition(sf::Vector2f(--planetX + planet_speed, planetY));
				App.draw(saturne);
			}
			else if (i == 5) {
				sun.setPosition(sf::Vector2f(--planetX + planet_speed, planetY));
				App.draw(sun);
			}

        if (socketsMachine.structBuffer.ope == 4) {
            gameInfo->_playerList[0].setPosition(socketsMachine.structBuffer.posX, socketsMachine.structBuffer.posY);
            socketsMachine.structBuffer.isEmpty = true;
        }

        if (fire) {
            BP.ope = 7;
            BP.playerID = gameInfo->_actualPlayerID;
            BP.speed = BULLET_SPEED;
            BP.isEmpty = false;
            socketsMachine.Sender(BP, gameInfo->_ip, gameInfo->_portRoom);
            socketsMachine.structBuffer.isEmpty = true;
        }

        if (socketsMachine.structBuffer.ope == 7) {
            Bullet newBullet(sf::Vector2f(50, 5));
            newBullet.setPosition(socketsMachine.structBuffer.bulletPosX, socketsMachine.structBuffer.bulletPosY);
            newBullet.x = socketsMachine.structBuffer.bulletPosX;
            newBullet.y = socketsMachine.structBuffer.bulletPosY;
            bullet.push_back(newBullet);
            fire_ship.playSound();
            fire = false;
            socketsMachine.structBuffer.isEmpty = true;
            socketsMachine.structBuffer.ope = 20;
        }

        for (int i = 0; i < bullet.size(); i++) {
            if (bullet[i].x <= 980) {
                bullet[i].x += BULLET_SPEED;
                bullet[i].draw(App, "fire_ship");
                for (auto &e : EnemyList) {
                    if (bullet[i].fireRight() > e._enemy.getPosition().x && bullet[i].fireTop() < e._enemy.getPosition().y + e._enemy.getScale().y
                        && bullet[i].fireBottom() > e._enemy.getPosition().y) {
                        e.isKilled = true;
                    }
                }
                bullet[i].setPosition(bullet[i].x, bullet[i].y);
            } else {
                bullet.erase(bullet.begin() + i);
            }

        }

        if (socketsMachine.structBuffer.ope == 6) {
            playersPositions = socketsMachine.structBuffer.playersPositions;

            boost::split(result, playersPositions, boost::is_any_of("\n"));
            for (int i = 0; i < result.size(); i++) {
                if (result[i].empty()) {
                    continue;
                }
                boost::split(res, result[i], boost::is_any_of("|"));
                for (auto &y : gameInfo->_playerList) {
                    if (y.id == std::stoi(res[0])) {
                        y.setPosition(std::stoi(res[1]), std::stoi(res[2]));
                    }
                }
            }
            socketsMachine.structBuffer.isEmpty = true;
        }

        for (auto i: gameInfo->_playerList) {
            if (i.id == 0)
                i.draw(App, "ship_blue");
            if (i.id == 1)
                i.draw(App, "ship_red");
            if (i.id == 2)
                i.draw(App, "ship_yellow");
            if (i.id == 3)
                i.draw(App, "ship_green");
        }

        for (auto &o : EnemyList) {
            if (o.isKilled == false)
                o.draw(App, "ship_blue");
        }

        if (socketsMachine.structBuffer.ope == 10) {
            enemyPositions = socketsMachine.structBuffer.enemyPosLists;
            boost::split(result, enemyPositions, boost::is_any_of("\n"));
            for (int i = 0; i < result.size(); i++) {
                if (result[i].empty()) {
                    continue;
                }
                boost::split(res, result[i], boost::is_any_of("|"));
                EnemyList[std::stoi(res[0])].setPosition(std::stoi(res[1]), std::stoi(res[2]));
            }
            socketsMachine.structBuffer.isEmpty = true;
            socketsMachine.structBuffer.ope = 20;
        }




        /*
        if (_startGame) {

        }*/

        sf::Time message = clock1.getElapsedTime();
        if (message.asSeconds() > 10)
            _startGame = true;
        if (message.asSeconds() > 1 && message.asSeconds() < 9) {
            if (message.asSeconds() > 2 && message.asSeconds() < 3)
                compteur.setString(L"5");
            if (message.asSeconds() > 3 && message.asSeconds() < 4)
                compteur.setString(L"4");
            if (message.asSeconds() > 4 && message.asSeconds() < 5)
                compteur.setString(L"3");
            if (message.asSeconds() > 5 && message.asSeconds() < 6)
                compteur.setString(L"2");
            if (message.asSeconds() > 6 && message.asSeconds() < 7)
                compteur.setString(L"1");
            if (message.asSeconds() > 7 && message.asSeconds() < 8)
                compteur.setString(L"0");

            App.draw(welcome);
            App.draw(compteur);
        }
        App.draw(heart1);
        App.draw(heart2);
        App.draw(heart3);
        App.draw(stage);
        App.display();

        socketsMachine.io_service.poll();
    }
}

screen_play::~screen_play()
{
}