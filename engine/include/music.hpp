//
// Created by hugo on 25/11/2019.
//

#ifndef R_TYPE_MUSIC_HPP
#define R_TYPE_MUSIC_HPP

#include <string>
#include <SFML/Graphics.hpp>
#include <SFML/Audio.hpp>
#include <memory>

class Music {
public:
    Music();
    ~Music();

    void playMusic(const std::string& music_name);
    void setVolume(int volume);
    int getVolume();
    void stopMusic(const std::string& music_name);
private:
    std::map<std::string, std::shared_ptr<sf::Music>> _music;
    std::shared_ptr<sf::Music> _lastmusic;
    int _volume;
};

#endif //R_TYPE_MUSIC_H
