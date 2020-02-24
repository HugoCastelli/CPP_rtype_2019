//
// Created by hugo on 01/12/2019.
//

#include "include/sounds.hpp"

Sound::Sound()
{
    _buffer.loadFromFile("engine/assets/audio/fire.ogg");
    _sound.setBuffer(_buffer);
}

void Sound::playSound()
{
    _sound.play();
}

Sound::~Sound()
{
}