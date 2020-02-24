cmake_minimum_required(VERSION 3.6)
project(r_type)

if (UNIX)
    set(CMAKE_CXX_STANDARD 11)

    include(build/conanbuildinfo.cmake)
    conan_basic_setup()

    file(GLOB sources_files ./engine/*.cpp ./engine/include/*.hpp)
    add_executable(r_type ${sources_files})
    target_link_libraries(r_type ${CONAN_LIBS})

    file(GLOB server_files ./server/*.cpp ./server/includes/*.hpp)
    add_executable(gameserver ${server_files})
    target_link_libraries(gameserver ${CONAN_LIBS})

endif (UNIX)

if (WIN32)
    set(CMAKE_CXX_STANDARD 11)

endif (WIN32)
