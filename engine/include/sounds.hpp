//
// Created by hugo on 01/12/2019.
//

#ifndef R_TYPE_SOUNDS_HPP
#define R_TYPE_SOUNDS_HPP

#include <SFML/Graphics.hpp>
#include <SFML/Audio.hpp>

class Sound {
public:
    Sound();
    ~Sound();
    void playSound();

    sf::Sound _sound;
    sf::SoundBuffer _buffer;
};

#endif //R_TYPE_SOUNDS_HPP
