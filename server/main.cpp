/*
** EPITECH PROJECT, 2019
** Rtype | EPITV Team + Maxime
** File description:
** main.cpp
*/

#include <SFML/System/Clock.hpp>
#include "includes/server.hpp"

using boost::asio::ip::udp;
using boost::asio::ip::address;


void sendPlayerPos(serverSockets *roomSockets, Room *room) {
    std::string returnValue;
    binaryProtocol tmpBuff;
    returnValue.clear();
    for (auto &i: room->playerList) {
        returnValue += std::to_string(i.playerID) + "|" + std::to_string(i.posX) + "|" + std::to_string(i.posY) + "\n";
    }
    tmpBuff.ope = 6;
    tmpBuff.isEmpty = false;
    std::strcpy(tmpBuff.playersPositons, returnValue.c_str());
    for (auto &i : room->ipList) {
        roomSockets->Sender(tmpBuff, i, room->roomId);
    }
}


void roomThread(int port, Room room) {
    serverSockets roomSockets(port);
    std::vector<std::string> splitted;
    std::string returnValue;
    binaryProtocol tmpBuff;
    sf::Clock clock;

    roomSockets.Receiver();
    while(true) {
        srand((unsigned)time(0));
        if (!roomSockets.structBuffer.isEmpty && roomSockets.structBuffer.ope == 4 && std::strcmp(roomSockets.structBuffer.movementDir, "MOVELEFT") == 0) {
            returnValue.clear();
            if (room.playerList[roomSockets.structBuffer.playerID].posX >= 0) {
                room.playerList[roomSockets.structBuffer.playerID].posX -= roomSockets.structBuffer.speed;
            }
            tmpBuff.isEmpty = false;
            tmpBuff.playerID = roomSockets.structBuffer.playerID;
            tmpBuff.posX = room.playerList[roomSockets.structBuffer.playerID].posX;
            tmpBuff.posY = room.playerList[roomSockets.structBuffer.playerID].posY;
            tmpBuff.ope = 4;
            roomSockets.Sender(tmpBuff, roomSockets.remote_endpoint.address().to_string(), room.roomId);
            roomSockets.structBuffer.isEmpty = true;
            sendPlayerPos(&roomSockets, &room);
        }
        if (!roomSockets.structBuffer.isEmpty && roomSockets.structBuffer.ope == 4 && std::strcmp(roomSockets.structBuffer.movementDir, "MOVERIGHT") == 0) {
            returnValue.clear();
            if (room.playerList[roomSockets.structBuffer.playerID].posX <= 950) {
                room.playerList[roomSockets.structBuffer.playerID].posX += roomSockets.structBuffer.speed;
            }
            tmpBuff.isEmpty = false;
            tmpBuff.playerID = roomSockets.structBuffer.playerID;
            tmpBuff.posX = room.playerList[roomSockets.structBuffer.playerID].posX;
            tmpBuff.posY = room.playerList[roomSockets.structBuffer.playerID].posY;
            tmpBuff.ope = 4;
            roomSockets.Sender(tmpBuff, roomSockets.remote_endpoint.address().to_string(), room.roomId);
            roomSockets.structBuffer.isEmpty = true;
            sendPlayerPos(&roomSockets, &room);
        }
        if (!roomSockets.structBuffer.isEmpty && roomSockets.structBuffer.ope == 4 && std::strcmp(roomSockets.structBuffer.movementDir, "MOVEUP") == 0) {
            returnValue.clear();
            if (room.playerList[roomSockets.structBuffer.playerID].posY >= 0) {
                room.playerList[roomSockets.structBuffer.playerID].posY -= roomSockets.structBuffer.speed;
            }
            tmpBuff.isEmpty = false;
            tmpBuff.playerID = roomSockets.structBuffer.playerID;
            tmpBuff.posX = room.playerList[roomSockets.structBuffer.playerID].posX;
            tmpBuff.posY = room.playerList[roomSockets.structBuffer.playerID].posY;
            tmpBuff.ope = 4;
            roomSockets.Sender(tmpBuff, roomSockets.remote_endpoint.address().to_string(), room.roomId);
            roomSockets.structBuffer.isEmpty = true;
            sendPlayerPos(&roomSockets, &room);
        }
        if (!roomSockets.structBuffer.isEmpty && roomSockets.structBuffer.ope == 4 && std::strcmp(roomSockets.structBuffer.movementDir, "MOVEDOWN") == 0) {
            returnValue.clear();
            if (room.playerList[roomSockets.structBuffer.playerID].posY <= 735) {
                room.playerList[roomSockets.structBuffer.playerID].posY += roomSockets.structBuffer.speed;
            }
            tmpBuff.isEmpty = false;
            tmpBuff.playerID = roomSockets.structBuffer.playerID;
            tmpBuff.posX = room.playerList[roomSockets.structBuffer.playerID].posX;
            tmpBuff.posY = room.playerList[roomSockets.structBuffer.playerID].posY;
            tmpBuff.ope = 4;
            roomSockets.Sender(tmpBuff, roomSockets.remote_endpoint.address().to_string(), room.roomId);
            roomSockets.structBuffer.isEmpty = true;
            sendPlayerPos(&roomSockets, &room);
        }
        if (!roomSockets.structBuffer.isEmpty && roomSockets.structBuffer.ope == 3) {
            returnValue.clear();
            Player newPlayer;
            newPlayer.playerID = room.playerList.size();
            newPlayer.playerName = roomSockets.structBuffer.playerName;
            newPlayer.posX = 0;
            newPlayer.posY = 0;
            tmpBuff.isEmpty = false;
            tmpBuff.playerID = room.playerList.size();
            std::strcpy(tmpBuff.roomName,room.roomName.c_str());
            tmpBuff.port = room.roomId;
            tmpBuff.ope = 3;
            room.playerList.emplace_back(newPlayer);
            room.ipList.push_back(roomSockets.remote_endpoint.address().to_string());
            roomSockets.Sender(tmpBuff, roomSockets.remote_endpoint.address().to_string(), room.roomId);
            roomSockets.structBuffer.isEmpty = true;


            returnValue.clear();
            for(auto &i: room.playerList) {
                returnValue += std::to_string(i.playerID) + "|" + i.playerName + "\n";
            }
            std::strcpy(tmpBuff.playerList, returnValue.c_str());
            tmpBuff.ope = 5;
            tmpBuff.isEmpty = false;
            for (auto &i : room.ipList) {
                for(int y = 0; y < 50; y++) {
                    roomSockets.Sender(tmpBuff, i, room.roomId);
                }
            }

            roomSockets.structBuffer.isEmpty = true;
        }
        if (!roomSockets.structBuffer.isEmpty && roomSockets.structBuffer.ope == 7) {
            Bullets tmpBullet;
            tmpBuff.isEmpty = false;
            tmpBuff.bulletPosX = room.playerList[roomSockets.structBuffer.playerID].posX;
            tmpBuff.bulletPosY = room.playerList[roomSockets.structBuffer.playerID].posY;
            tmpBuff.ope = 7;
            tmpBullet.posX = tmpBuff.bulletPosX;
            tmpBullet.posY = tmpBuff.bulletPosY;
            tmpBullet.speed = tmpBuff.bulletSpeed;
            for (auto &i : room.ipList) {
                roomSockets.Sender(tmpBuff, i, room.roomId);
            }
            roomSockets.structBuffer.isEmpty = true;
        }
        if (!roomSockets.structBuffer.isEmpty && roomSockets.structBuffer.ope == 9) {
            Enemy tmpEnemy;
            tmpEnemy.posX = roomSockets.structBuffer.enemyPosX;
            tmpEnemy.posY = roomSockets.structBuffer.enemyPosY;
            tmpEnemy.speed = roomSockets.structBuffer.enemySpeed;
            tmpEnemy.id = roomSockets.structBuffer.enemyID;
            room.enemyList.emplace_back(tmpEnemy);
            roomSockets.structBuffer.isEmpty = true;
        }

        sf::Time sendDataEnemy = clock.getElapsedTime();
        if (sendDataEnemy.asMilliseconds() == 100) {
            returnValue.clear();
            for (auto &i : room.enemyList) {
                if (i.posX > 940)
                    i.posX -= i.speed;
                else {
                    i.posX += rand()%i.speed * rand()%3;
                    i.posX -= rand()%i.speed * rand()%4;
                    i.posY += rand()%i.speed * rand()%3;
                    i.posY -= rand()%i.speed * rand()%4;
                }
                returnValue += std::to_string(i.id) + "|" + std::to_string(i.posX) + "|" + std::to_string(i.posY) + "\n";
                tmpBuff.ope = 10;
                tmpBuff.isEmpty = false;
                std::strcpy(tmpBuff.enemyPosLists, returnValue.c_str());
            }
            for (auto &y : room.ipList) {
                roomSockets.Sender(tmpBuff, y, room.roomId);
            }
            clock.restart();
        }

        roomSockets.io_service.poll();
    }
}


int main(int argc, char *argv[]) {
    int port = 4242;
    serverSockets server(port);
    Game game;
    std::string returnSTR = "";
    binaryProtocol tmpBuff;


    server.Receiver();
    while (1) {
        if (!server.structBuffer.isEmpty && server.structBuffer.ope == 0) {
            Room tmp;
            Player tmpPlayer;
            tmpPlayer.roomId = port;
            tmpPlayer.playerID = 0;
            tmpPlayer.playerName = server.structBuffer.playerName;
            tmpPlayer.posX = 0;
            tmpPlayer.posY = 0;
            tmp.roomId = port + 1;
            tmp.roomName = server.structBuffer.roomName;
            tmp.playerList.emplace_back(tmpPlayer);
            tmp.ipList.push_back(server.remote_endpoint.address().to_string());
            game.roomList.push_back(tmp);
            port++;
            game.roomThreads.emplace_back(std::thread(roomThread, port, tmp));
            tmpBuff.isEmpty = false;
            tmpBuff.ope = 0;
            tmpBuff.port = tmp.roomId;

            for(int i = 0; i < 50; i++) {
                server.Sender(tmpBuff, server.remote_endpoint.address().to_string(), 4242);
            }

            returnSTR.clear();
            returnSTR += std::to_string(tmpPlayer.playerID) + "|" + tmpPlayer.playerName + "\n";
            tmpBuff.ope = 5;
            std::strcpy(tmpBuff.playerList, returnSTR.c_str());
            for(int i = 0; i < 5; i++) {
                server.Sender(tmpBuff, server.remote_endpoint.address().to_string(), tmp.roomId);
            }
            server.structBuffer.isEmpty = true;
        } else if (!server.structBuffer.isEmpty && server.structBuffer.ope == 1) {
            returnSTR.clear();
            for(auto &i : game.roomList) {
                returnSTR += i.roomName + "|" + std::to_string(i.roomId) + "\n";
            }
            tmpBuff.ope = 1;
            tmpBuff.isEmpty = false;
            std::strcpy(tmpBuff.roomList, returnSTR.c_str());
            server.Sender(tmpBuff, server.remote_endpoint.address().to_string(), 4242);
            server.structBuffer.isEmpty = true;

        }

        for(auto &i : game.roomThreads) {
            if (i.joinable()) {
                i.detach();
            }
        }
        server.io_service.poll();
    }
    server.socket.close();
}
