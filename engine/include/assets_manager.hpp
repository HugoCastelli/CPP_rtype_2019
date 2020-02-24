//
// Created by hugo on 23/11/2019.
//

#ifndef R_TYPE_ASSETS_MANAGER_HPP
#define R_TYPE_ASSETS_MANAGER_HPP

#include <SFML/Window.hpp>
#include <SFML/Graphics.hpp>

class AssetsManager
{
public:
    AssetsManager();
    ~AssetsManager();

    void LoadTextures(std::string name, std::string filename);
    sf::Texture &GetTexture(std::string name);

    void LoadFont(std::string name, std::string filename);
    sf::Font &GetFont(std::string name);

    void CreateText(std::string name, sf::Vector2f position);
    sf::Text &GetText(std::string name);

private:
    std::map<std::string, sf::Texture> textures;
    std::map<std::string, sf::Font> fonts;
    std::map<std::string, sf::Text> texts;


};

#endif //R_TYPE_ASSETS_MANAGER_HPP
