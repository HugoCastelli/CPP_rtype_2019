/*
** EPITECH PROJECT, 2019
** Rtype | EPITV Team + Maxime
** File description:
** main.cpp
*/

#include <SFML/System/Clock.hpp>
#include "include/sockets.hpp"

Sockets::Sockets(int port) {
    structBuffer.isEmpty = true;
    this->port = port;
}

void Sockets::Sender(binaryProtocol in, std::string IP, int PORT) {
    udp::socket socket{io_service};
    boost::asio::mutable_buffers_1 buffer = boost::asio::buffer(&in, sizeof(binaryProtocol));
    remote_endpoint = udp::endpoint(address::from_string(IP), PORT);
    socket.open(udp::v4());

    boost::system::error_code err;
    auto sent = socket.send_to(buffer, remote_endpoint, 0, err);
    socket.close();
}

void Sockets::handle_receive(const boost::system::error_code &error, size_t bytes_transferred)
{
    if (bytes_transferred == 0) {
        return;
    }
    binaryProtocol tmp;
    memcpy(&tmp, _buffer, sizeof(binaryProtocol));
    structBuffer = tmp;
    socket.close();
    this->Receiver();
}

void Sockets::wait() {
    socket.async_receive_from(boost::asio::buffer(_buffer, sizeof(binaryProtocol)), remote_endpoint, boost::bind(&Sockets::handle_receive, this, boost::asio::placeholders::error, boost::asio::placeholders::bytes_transferred));
}

void Sockets::Receiver() {
    socket.open(udp::v4());
    socket.bind(udp::endpoint(address::from_string(IPADDRESS), port));
    wait();
}

bool Sockets::WaitResponse(Sockets *socketsMachine) {
    socketsMachine->Receiver();
    sf::Clock clock;

    while (1) {
        sf::Time timeout = clock.getElapsedTime();
        if (timeout.asSeconds() == 1) {
            socketsMachine->socket.close();
            return false;
            break;
        }
        if (!socketsMachine->structBuffer.isEmpty) {
            socketsMachine->socket.close();
            return true;
            break;
        }
        socketsMachine->io_service.poll();
    }
}