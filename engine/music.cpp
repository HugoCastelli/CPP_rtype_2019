//
// Created by hugo on 25/11/2019.
//

#include "include/music.hpp"
#include <memory>

Music::Music()
{
    _volume = 50;
    auto pair = std::make_pair("ui", std::make_shared<sf::Music>());
    _music.insert(pair);
    _music["ui"]->openFromFile("engine/assets/audio/menu.ogg");
    _music["ui"]->setLoop(true);

    pair = std::make_pair("play", std::make_shared<sf::Music>());
    _music.insert(pair);
    _music["play"]->openFromFile("engine/assets/audio/gameplay.ogg");
    _music["play"]->setLoop(true);
}

void Music::setVolume(int volume)
{
    _volume = volume;
}

int Music::getVolume()
{
    return _volume;
}

void Music::stopMusic(const std::string &music_name)
{
    _music[music_name]->stop();
}

void Music::playMusic(const std::string &music_name)
{
    if (_lastmusic) {
        _lastmusic->stop();
    }
    _music[music_name]->setVolume(_volume);
    _music[music_name]->play();
    _lastmusic = _music[music_name];
}

Music::~Music()
{
}