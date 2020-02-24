//
// Created by hugo on 23/11/2019.
//

#include <iostream>
#include "include/assets_manager.hpp"

AssetsManager::AssetsManager()
{
    this->LoadTextures("background", "engine/assets/background.png");
    this->LoadTextures("title_rtype", "engine/assets/R-TYPE.png");
    this->LoadTextures("input", "engine/assets/barre.png");
    this->LoadTextures("background", "engine/assets/background.png");
    this->LoadFont("8bits", "engine/assets/font/font.ttf");
    this->LoadTextures("game_1", "engine/assets/game/game_1.png");
    this->LoadTextures("game_2", "engine/assets/game/game_2.png");
    this->LoadTextures("game_3", "engine/assets/game/game_3.png");
    this->LoadTextures("bg_black", "engine/assets/bg_black.png");
    this->LoadTextures("bg_modal", "engine/assets/bg_modal.png");
	this->LoadTextures("ship_blue", "engine/assets/ship/ship_blue.png");
	this->LoadTextures("ship_yellow", "engine/assets/ship/ship_yellow.png");
	this->LoadTextures("ship_red", "engine/assets/ship/ship_red.png");
	this->LoadTextures("ship_green", "engine/assets/ship/ship_green.png");
	this->LoadTextures("ship_lobby", "engine/assets/ship/ship_lobby.png");
	this->LoadTextures("crown", "engine/assets/crown.png");
	this->LoadTextures("bg_para", "engine/assets/bg_para.png");
	this->LoadTextures("earth", "engine/assets/planet/earth.png");
	this->LoadTextures("sun", "engine/assets/planet/soleil.png");
	this->LoadTextures("saturne", "engine/assets/planet/saturne.png");
	this->LoadTextures("mars", "engine/assets/planet/mars.png");
	this->LoadTextures("venus", "engine/assets/planet/venus.png");
	this->LoadTextures("fire_ship", "engine/assets/fire/5.bmp");
	this->LoadTextures("signal", "engine/assets/signal.png");
	this->LoadTextures("heart", "engine/assets/life.png");
	this->LoadTextures("ennemy", "engine/assets/ennemy_ship.png");
}

void AssetsManager::LoadTextures(std::string name, std::string filename)
{
    sf::Texture tex;

    if (tex.loadFromFile(filename)) {
        textures[name] = tex;
    }
}

sf::Texture& AssetsManager::GetTexture(std::string name)
{
    return textures.at(name);
}

void AssetsManager::LoadFont(std::string name, std::string filename)
{
    sf::Font font;

    if (font.loadFromFile(filename)) {
        fonts[name] = font;
    }
}

sf::Font& AssetsManager::GetFont(std::string name)
{
    return fonts.at(name);
}

void AssetsManager::CreateText(std::string name, sf::Vector2f position)
{
    sf::Font Font = this->GetFont("8bits");
    sf::Text text;

    text.setFont(Font);
    text.setString(name);
    text.setCharacterSize(30);
    text.setPosition(position);
    text.setFillColor(sf::Color(255, 255, 255));

    texts[name] = text;
}

sf::Text& AssetsManager::GetText(std::string name)
{
    return texts.at(name);
}

AssetsManager::~AssetsManager()
{
}