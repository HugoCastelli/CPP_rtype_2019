/*
** EPITECH PROJECT, 2019
** Rtype | EPITV Team + Maxime
** File description:
** main.cpp
*/

#include "includes/serverSockets.hpp"

using namespace std;

serverSockets::serverSockets(int port) {
    structBuffer.isEmpty = true;
    socket.open(udp::v4());
    socket.bind(udp::endpoint(address::from_string(IPADDRESS), port));
}

void serverSockets::Sender(binaryProtocol in, std::string IP, int PORT) {
    boost::asio::io_service UDPSERVICE;
    udp::socket UDPSEND(UDPSERVICE);
    udp::endpoint UDPsendpoint = udp::endpoint(address::from_string(IP), PORT);
    boost::asio::mutable_buffers_1 buffer = boost::asio::buffer(&in, sizeof(binaryProtocol));
//    std::cout << "Players positions: " << in.playersPositons << std::endl;
//    std::cout << "Player X: " << in.posX << std::endl;
//    std::cout << "Ope: " << in.ope << std::endl;
//    std::cout << "Ip: " << IP << std::endl;
//    std::cout << "Players list: " << in.playerList << std::endl;
    UDPSEND.open(udp::v4());
    boost::system::error_code err;
    auto sent = UDPSEND.send_to(buffer, UDPsendpoint, 0, err);
    UDPSERVICE.stop();
    UDPSEND.close();
}

void serverSockets::handle_receive(const boost::system::error_code &error, size_t bytes_transferred) {
    if (bytes_transferred == 0) {
        return;
    }
    binaryProtocol tmp;
    //std::memmove(&structBuffer, _buffer, sizeof(binary))
    std::memcpy(&tmp, _buffer, sizeof(binaryProtocol));

    structBuffer = tmp;

    this->Receiver();
}

void serverSockets::wait() {
    socket.async_receive_from(boost::asio::buffer(_buffer, sizeof(binaryProtocol)), remote_endpoint, boost::bind(&serverSockets::handle_receive, this, boost::asio::placeholders::error, boost::asio::placeholders::bytes_transferred));
}

void serverSockets::Receiver() {
    wait();
}