include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
                set(CONAN_FRAMEWORKS ${CONAN_FRAMEWORKS_DEBUG} ${CONAN_FRAMEWORKS})
                set(CONAN_FRAMEWORK_DIRS ${CONAN_FRAMEWORK_DIRS_DEBUG} ${CONAN_FRAMEWORK_DIRS})
            elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
                set(CONAN_FRAMEWORKS ${CONAN_FRAMEWORKS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
                set(CONAN_FRAMEWORK_DIRS ${CONAN_FRAMEWORK_DIRS_RELEASE} ${CONAN_FRAMEWORK_DIRS})
            elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
                set(CONAN_FRAMEWORKS ${CONAN_FRAMEWORKS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
                set(CONAN_FRAMEWORK_DIRS ${CONAN_FRAMEWORK_DIRS_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS})
            elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
                set(CONAN_FRAMEWORKS ${CONAN_FRAMEWORKS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
                set(CONAN_FRAMEWORK_DIRS ${CONAN_FRAMEWORK_DIRS_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS})
            endif()
        endif()
        
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS})
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS}")
            endif()
        endforeach()
    endif()
endmacro()


set(CONAN_SFML_ROOT "/home/hugo/.conan/data/sfml/2.5.1/bincrafters/stable/package/8b7784d5fc174258519ade3ba45409d3f6e66c75")
set(CONAN_INCLUDE_DIRS_SFML "/home/hugo/.conan/data/sfml/2.5.1/bincrafters/stable/package/8b7784d5fc174258519ade3ba45409d3f6e66c75/include")
set(CONAN_LIB_DIRS_SFML "/home/hugo/.conan/data/sfml/2.5.1/bincrafters/stable/package/8b7784d5fc174258519ade3ba45409d3f6e66c75/lib")
set(CONAN_BIN_DIRS_SFML )
set(CONAN_RES_DIRS_SFML )
set(CONAN_SRC_DIRS_SFML )
set(CONAN_BUILD_DIRS_SFML "/home/hugo/.conan/data/sfml/2.5.1/bincrafters/stable/package/8b7784d5fc174258519ade3ba45409d3f6e66c75/")
set(CONAN_FRAMEWORK_DIRS_SFML )
set(CONAN_LIBS_SFML sfml-graphics-s sfml-window-s sfml-network-s sfml-audio-s sfml-system-s Xrandr Xext Xrender X11 pthread xcb Xau Xdmcp GL udev)
set(CONAN_PKG_LIBS_SFML sfml-graphics-s sfml-window-s sfml-network-s sfml-audio-s sfml-system-s Xrandr Xext Xrender X11 pthread xcb Xau Xdmcp GL udev)
set(CONAN_SYSTEM_LIBS_SFML )
set(CONAN_FRAMEWORKS_SFML )
set(CONAN_FRAMEWORKS_FOUND_SFML "")  # Will be filled later
set(CONAN_DEFINES_SFML "-DSFML_STATIC")
set(CONAN_BUILD_MODULES_PATHS_SFML )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_SFML "SFML_STATIC")

set(CONAN_C_FLAGS_SFML "")
set(CONAN_CXX_FLAGS_SFML "")
set(CONAN_SHARED_LINKER_FLAGS_SFML "")
set(CONAN_EXE_LINKER_FLAGS_SFML "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_SFML_LIST "")
set(CONAN_CXX_FLAGS_SFML_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_SFML_LIST "")
set(CONAN_EXE_LINKER_FLAGS_SFML_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_SFML "${CONAN_FRAMEWORKS_SFML}")
# Append to aggregated values variable
set(CONAN_LIBS_SFML ${CONAN_PKG_LIBS_SFML} ${CONAN_SYSTEM_LIBS_SFML} ${CONAN_FRAMEWORKS_FOUND_SFML})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_SFML ${CONAN_PKG_LIBS_SFML} ${CONAN_FRAMEWORKS_FOUND_SFML})


set(CONAN_BOOST_ROOT "/home/hugo/.conan/data/boost/1.71.0/conan/stable/package/63aa18f4c96abf22f1e546119f1f7bbee8e30165")
set(CONAN_INCLUDE_DIRS_BOOST "/home/hugo/.conan/data/boost/1.71.0/conan/stable/package/63aa18f4c96abf22f1e546119f1f7bbee8e30165/include")
set(CONAN_LIB_DIRS_BOOST "/home/hugo/.conan/data/boost/1.71.0/conan/stable/package/63aa18f4c96abf22f1e546119f1f7bbee8e30165/lib")
set(CONAN_BIN_DIRS_BOOST )
set(CONAN_RES_DIRS_BOOST )
set(CONAN_SRC_DIRS_BOOST )
set(CONAN_BUILD_DIRS_BOOST "/home/hugo/.conan/data/boost/1.71.0/conan/stable/package/63aa18f4c96abf22f1e546119f1f7bbee8e30165/")
set(CONAN_FRAMEWORK_DIRS_BOOST )
set(CONAN_LIBS_BOOST boost_wave boost_container boost_contract boost_exception boost_graph boost_iostreams boost_locale boost_log boost_program_options boost_random boost_regex boost_serialization boost_wserialization boost_coroutine boost_fiber boost_context boost_timer boost_thread boost_chrono boost_date_time boost_atomic boost_filesystem boost_system boost_type_erasure boost_log_setup boost_math_c99 boost_math_c99f boost_math_c99l boost_math_tr1 boost_math_tr1f boost_math_tr1l boost_stacktrace_addr2line boost_stacktrace_backtrace boost_stacktrace_basic boost_stacktrace_noop boost_unit_test_framework pthread)
set(CONAN_PKG_LIBS_BOOST boost_wave boost_container boost_contract boost_exception boost_graph boost_iostreams boost_locale boost_log boost_program_options boost_random boost_regex boost_serialization boost_wserialization boost_coroutine boost_fiber boost_context boost_timer boost_thread boost_chrono boost_date_time boost_atomic boost_filesystem boost_system boost_type_erasure boost_log_setup boost_math_c99 boost_math_c99f boost_math_c99l boost_math_tr1 boost_math_tr1f boost_math_tr1l boost_stacktrace_addr2line boost_stacktrace_backtrace boost_stacktrace_basic boost_stacktrace_noop boost_unit_test_framework pthread)
set(CONAN_SYSTEM_LIBS_BOOST )
set(CONAN_FRAMEWORKS_BOOST )
set(CONAN_FRAMEWORKS_FOUND_BOOST "")  # Will be filled later
set(CONAN_DEFINES_BOOST "-D_GLIBCXX_USE_CXX11_ABI=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST "_GLIBCXX_USE_CXX11_ABI=1")

set(CONAN_C_FLAGS_BOOST "")
set(CONAN_CXX_FLAGS_BOOST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_LIST "")
set(CONAN_CXX_FLAGS_BOOST_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST "${CONAN_FRAMEWORKS_BOOST}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST ${CONAN_PKG_LIBS_BOOST} ${CONAN_SYSTEM_LIBS_BOOST} ${CONAN_FRAMEWORKS_FOUND_BOOST})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST ${CONAN_PKG_LIBS_BOOST} ${CONAN_FRAMEWORKS_FOUND_BOOST})


set(CONAN_BOOST_ASIO_ROOT "/home/hugo/.conan/data/boost_asio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_ASIO "/home/hugo/.conan/data/boost_asio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/asio/include")
set(CONAN_LIB_DIRS_BOOST_ASIO "/home/hugo/.conan/data/boost_asio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/asio/lib")
set(CONAN_BIN_DIRS_BOOST_ASIO "/home/hugo/.conan/data/boost_asio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/asio/lib")
set(CONAN_RES_DIRS_BOOST_ASIO )
set(CONAN_SRC_DIRS_BOOST_ASIO )
set(CONAN_BUILD_DIRS_BOOST_ASIO "/home/hugo/.conan/data/boost_asio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_ASIO )
set(CONAN_LIBS_BOOST_ASIO )
set(CONAN_PKG_LIBS_BOOST_ASIO )
set(CONAN_SYSTEM_LIBS_BOOST_ASIO )
set(CONAN_FRAMEWORKS_BOOST_ASIO )
set(CONAN_FRAMEWORKS_FOUND_BOOST_ASIO "")  # Will be filled later
set(CONAN_DEFINES_BOOST_ASIO "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_ASIO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_ASIO "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_ASIO "")
set(CONAN_CXX_FLAGS_BOOST_ASIO "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ASIO "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ASIO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_ASIO_LIST "")
set(CONAN_CXX_FLAGS_BOOST_ASIO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ASIO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ASIO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_ASIO "${CONAN_FRAMEWORKS_BOOST_ASIO}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_ASIO ${CONAN_PKG_LIBS_BOOST_ASIO} ${CONAN_SYSTEM_LIBS_BOOST_ASIO} ${CONAN_FRAMEWORKS_FOUND_BOOST_ASIO})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_ASIO ${CONAN_PKG_LIBS_BOOST_ASIO} ${CONAN_FRAMEWORKS_FOUND_BOOST_ASIO})


set(CONAN_FREETYPE_ROOT "/home/hugo/.conan/data/freetype/2.9.0/bincrafters/stable/package/3cdd93cd46fc07735d1b0d7f2860a82fac7a3053")
set(CONAN_INCLUDE_DIRS_FREETYPE "/home/hugo/.conan/data/freetype/2.9.0/bincrafters/stable/package/3cdd93cd46fc07735d1b0d7f2860a82fac7a3053/include"
			"/home/hugo/.conan/data/freetype/2.9.0/bincrafters/stable/package/3cdd93cd46fc07735d1b0d7f2860a82fac7a3053/include/freetype2")
set(CONAN_LIB_DIRS_FREETYPE "/home/hugo/.conan/data/freetype/2.9.0/bincrafters/stable/package/3cdd93cd46fc07735d1b0d7f2860a82fac7a3053/lib")
set(CONAN_BIN_DIRS_FREETYPE )
set(CONAN_RES_DIRS_FREETYPE )
set(CONAN_SRC_DIRS_FREETYPE )
set(CONAN_BUILD_DIRS_FREETYPE "/home/hugo/.conan/data/freetype/2.9.0/bincrafters/stable/package/3cdd93cd46fc07735d1b0d7f2860a82fac7a3053/")
set(CONAN_FRAMEWORK_DIRS_FREETYPE )
set(CONAN_LIBS_FREETYPE freetype m)
set(CONAN_PKG_LIBS_FREETYPE freetype m)
set(CONAN_SYSTEM_LIBS_FREETYPE )
set(CONAN_FRAMEWORKS_FREETYPE )
set(CONAN_FRAMEWORKS_FOUND_FREETYPE "")  # Will be filled later
set(CONAN_DEFINES_FREETYPE )
set(CONAN_BUILD_MODULES_PATHS_FREETYPE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FREETYPE )

set(CONAN_C_FLAGS_FREETYPE "")
set(CONAN_CXX_FLAGS_FREETYPE "")
set(CONAN_SHARED_LINKER_FLAGS_FREETYPE "")
set(CONAN_EXE_LINKER_FLAGS_FREETYPE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FREETYPE_LIST "")
set(CONAN_CXX_FLAGS_FREETYPE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FREETYPE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FREETYPE "${CONAN_FRAMEWORKS_FREETYPE}")
# Append to aggregated values variable
set(CONAN_LIBS_FREETYPE ${CONAN_PKG_LIBS_FREETYPE} ${CONAN_SYSTEM_LIBS_FREETYPE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_FREETYPE ${CONAN_PKG_LIBS_FREETYPE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE})


set(CONAN_STB_ROOT "/home/hugo/.conan/data/stb/20180214/conan/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_STB "/home/hugo/.conan/data/stb/20180214/conan/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_STB )
set(CONAN_BIN_DIRS_STB )
set(CONAN_RES_DIRS_STB )
set(CONAN_SRC_DIRS_STB )
set(CONAN_BUILD_DIRS_STB "/home/hugo/.conan/data/stb/20180214/conan/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_STB )
set(CONAN_LIBS_STB )
set(CONAN_PKG_LIBS_STB )
set(CONAN_SYSTEM_LIBS_STB )
set(CONAN_FRAMEWORKS_STB )
set(CONAN_FRAMEWORKS_FOUND_STB "")  # Will be filled later
set(CONAN_DEFINES_STB "-DSTB_TEXTEDIT_KEYTYPE=unsigned")
set(CONAN_BUILD_MODULES_PATHS_STB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_STB "STB_TEXTEDIT_KEYTYPE=unsigned")

set(CONAN_C_FLAGS_STB "")
set(CONAN_CXX_FLAGS_STB "")
set(CONAN_SHARED_LINKER_FLAGS_STB "")
set(CONAN_EXE_LINKER_FLAGS_STB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_STB_LIST "")
set(CONAN_CXX_FLAGS_STB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_STB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_STB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_STB "${CONAN_FRAMEWORKS_STB}")
# Append to aggregated values variable
set(CONAN_LIBS_STB ${CONAN_PKG_LIBS_STB} ${CONAN_SYSTEM_LIBS_STB} ${CONAN_FRAMEWORKS_FOUND_STB})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_STB ${CONAN_PKG_LIBS_STB} ${CONAN_FRAMEWORKS_FOUND_STB})


set(CONAN_OPENAL_ROOT "/home/hugo/.conan/data/openal/1.19.0/bincrafters/stable/package/812e1deb664b70de9456fc54c225f826fbca36e7")
set(CONAN_INCLUDE_DIRS_OPENAL "/home/hugo/.conan/data/openal/1.19.0/bincrafters/stable/package/812e1deb664b70de9456fc54c225f826fbca36e7/include"
			"/home/hugo/.conan/data/openal/1.19.0/bincrafters/stable/package/812e1deb664b70de9456fc54c225f826fbca36e7/include/AL")
set(CONAN_LIB_DIRS_OPENAL "/home/hugo/.conan/data/openal/1.19.0/bincrafters/stable/package/812e1deb664b70de9456fc54c225f826fbca36e7/lib")
set(CONAN_BIN_DIRS_OPENAL )
set(CONAN_RES_DIRS_OPENAL )
set(CONAN_SRC_DIRS_OPENAL )
set(CONAN_BUILD_DIRS_OPENAL "/home/hugo/.conan/data/openal/1.19.0/bincrafters/stable/package/812e1deb664b70de9456fc54c225f826fbca36e7/")
set(CONAN_FRAMEWORK_DIRS_OPENAL )
set(CONAN_LIBS_OPENAL openal dl m)
set(CONAN_PKG_LIBS_OPENAL openal dl m)
set(CONAN_SYSTEM_LIBS_OPENAL )
set(CONAN_FRAMEWORKS_OPENAL )
set(CONAN_FRAMEWORKS_FOUND_OPENAL "")  # Will be filled later
set(CONAN_DEFINES_OPENAL "-DAL_LIBTYPE_STATIC")
set(CONAN_BUILD_MODULES_PATHS_OPENAL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENAL "AL_LIBTYPE_STATIC")

set(CONAN_C_FLAGS_OPENAL "")
set(CONAN_CXX_FLAGS_OPENAL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENAL "")
set(CONAN_EXE_LINKER_FLAGS_OPENAL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENAL_LIST "")
set(CONAN_CXX_FLAGS_OPENAL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENAL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENAL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENAL "${CONAN_FRAMEWORKS_OPENAL}")
# Append to aggregated values variable
set(CONAN_LIBS_OPENAL ${CONAN_PKG_LIBS_OPENAL} ${CONAN_SYSTEM_LIBS_OPENAL} ${CONAN_FRAMEWORKS_FOUND_OPENAL})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_OPENAL ${CONAN_PKG_LIBS_OPENAL} ${CONAN_FRAMEWORKS_FOUND_OPENAL})


set(CONAN_FLAC_ROOT "/home/hugo/.conan/data/flac/1.3.2/bincrafters/stable/package/ef227c7ca8be49f078e2c7c4a6cebbac879b693a")
set(CONAN_INCLUDE_DIRS_FLAC "/home/hugo/.conan/data/flac/1.3.2/bincrafters/stable/package/ef227c7ca8be49f078e2c7c4a6cebbac879b693a/include")
set(CONAN_LIB_DIRS_FLAC "/home/hugo/.conan/data/flac/1.3.2/bincrafters/stable/package/ef227c7ca8be49f078e2c7c4a6cebbac879b693a/lib")
set(CONAN_BIN_DIRS_FLAC )
set(CONAN_RES_DIRS_FLAC )
set(CONAN_SRC_DIRS_FLAC )
set(CONAN_BUILD_DIRS_FLAC "/home/hugo/.conan/data/flac/1.3.2/bincrafters/stable/package/ef227c7ca8be49f078e2c7c4a6cebbac879b693a/")
set(CONAN_FRAMEWORK_DIRS_FLAC )
set(CONAN_LIBS_FLAC flac flac++)
set(CONAN_PKG_LIBS_FLAC flac flac++)
set(CONAN_SYSTEM_LIBS_FLAC )
set(CONAN_FRAMEWORKS_FLAC )
set(CONAN_FRAMEWORKS_FOUND_FLAC "")  # Will be filled later
set(CONAN_DEFINES_FLAC "-DFLAC__NO_DLL")
set(CONAN_BUILD_MODULES_PATHS_FLAC )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FLAC "FLAC__NO_DLL")

set(CONAN_C_FLAGS_FLAC "")
set(CONAN_CXX_FLAGS_FLAC "")
set(CONAN_SHARED_LINKER_FLAGS_FLAC "")
set(CONAN_EXE_LINKER_FLAGS_FLAC "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FLAC_LIST "")
set(CONAN_CXX_FLAGS_FLAC_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FLAC_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FLAC_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FLAC "${CONAN_FRAMEWORKS_FLAC}")
# Append to aggregated values variable
set(CONAN_LIBS_FLAC ${CONAN_PKG_LIBS_FLAC} ${CONAN_SYSTEM_LIBS_FLAC} ${CONAN_FRAMEWORKS_FOUND_FLAC})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_FLAC ${CONAN_PKG_LIBS_FLAC} ${CONAN_FRAMEWORKS_FOUND_FLAC})


set(CONAN_VORBIS_ROOT "/home/hugo/.conan/data/vorbis/1.3.6/bincrafters/stable/package/8d8cebdeda6ff46ba515968aa8b099a24769ca16")
set(CONAN_INCLUDE_DIRS_VORBIS "/home/hugo/.conan/data/vorbis/1.3.6/bincrafters/stable/package/8d8cebdeda6ff46ba515968aa8b099a24769ca16/include")
set(CONAN_LIB_DIRS_VORBIS "/home/hugo/.conan/data/vorbis/1.3.6/bincrafters/stable/package/8d8cebdeda6ff46ba515968aa8b099a24769ca16/lib")
set(CONAN_BIN_DIRS_VORBIS )
set(CONAN_RES_DIRS_VORBIS )
set(CONAN_SRC_DIRS_VORBIS )
set(CONAN_BUILD_DIRS_VORBIS "/home/hugo/.conan/data/vorbis/1.3.6/bincrafters/stable/package/8d8cebdeda6ff46ba515968aa8b099a24769ca16/")
set(CONAN_FRAMEWORK_DIRS_VORBIS )
set(CONAN_LIBS_VORBIS vorbisfile vorbisenc vorbis m)
set(CONAN_PKG_LIBS_VORBIS vorbisfile vorbisenc vorbis m)
set(CONAN_SYSTEM_LIBS_VORBIS )
set(CONAN_FRAMEWORKS_VORBIS )
set(CONAN_FRAMEWORKS_FOUND_VORBIS "")  # Will be filled later
set(CONAN_DEFINES_VORBIS )
set(CONAN_BUILD_MODULES_PATHS_VORBIS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_VORBIS )

set(CONAN_C_FLAGS_VORBIS "")
set(CONAN_CXX_FLAGS_VORBIS "")
set(CONAN_SHARED_LINKER_FLAGS_VORBIS "")
set(CONAN_EXE_LINKER_FLAGS_VORBIS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_VORBIS_LIST "")
set(CONAN_CXX_FLAGS_VORBIS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_VORBIS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_VORBIS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_VORBIS "${CONAN_FRAMEWORKS_VORBIS}")
# Append to aggregated values variable
set(CONAN_LIBS_VORBIS ${CONAN_PKG_LIBS_VORBIS} ${CONAN_SYSTEM_LIBS_VORBIS} ${CONAN_FRAMEWORKS_FOUND_VORBIS})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_VORBIS ${CONAN_PKG_LIBS_VORBIS} ${CONAN_FRAMEWORKS_FOUND_VORBIS})


set(CONAN_BOOST_COROUTINE_ROOT "/home/hugo/.conan/data/boost_coroutine/1.69.0/bincrafters/stable/package/3a126ad3c96cb43850c72e8d16858ee488064b51")
set(CONAN_INCLUDE_DIRS_BOOST_COROUTINE "/home/hugo/.conan/data/boost_coroutine/1.69.0/bincrafters/stable/package/3a126ad3c96cb43850c72e8d16858ee488064b51/coroutine/include")
set(CONAN_LIB_DIRS_BOOST_COROUTINE "/home/hugo/.conan/data/boost_coroutine/1.69.0/bincrafters/stable/package/3a126ad3c96cb43850c72e8d16858ee488064b51/coroutine/lib")
set(CONAN_BIN_DIRS_BOOST_COROUTINE "/home/hugo/.conan/data/boost_coroutine/1.69.0/bincrafters/stable/package/3a126ad3c96cb43850c72e8d16858ee488064b51/coroutine/lib")
set(CONAN_RES_DIRS_BOOST_COROUTINE )
set(CONAN_SRC_DIRS_BOOST_COROUTINE )
set(CONAN_BUILD_DIRS_BOOST_COROUTINE "/home/hugo/.conan/data/boost_coroutine/1.69.0/bincrafters/stable/package/3a126ad3c96cb43850c72e8d16858ee488064b51/")
set(CONAN_FRAMEWORK_DIRS_BOOST_COROUTINE )
set(CONAN_LIBS_BOOST_COROUTINE boost_coroutine)
set(CONAN_PKG_LIBS_BOOST_COROUTINE boost_coroutine)
set(CONAN_SYSTEM_LIBS_BOOST_COROUTINE )
set(CONAN_FRAMEWORKS_BOOST_COROUTINE )
set(CONAN_FRAMEWORKS_FOUND_BOOST_COROUTINE "")  # Will be filled later
set(CONAN_DEFINES_BOOST_COROUTINE "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_COROUTINE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_COROUTINE "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_COROUTINE "")
set(CONAN_CXX_FLAGS_BOOST_COROUTINE "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_COROUTINE "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_COROUTINE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_COROUTINE_LIST "")
set(CONAN_CXX_FLAGS_BOOST_COROUTINE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_COROUTINE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_COROUTINE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_COROUTINE "${CONAN_FRAMEWORKS_BOOST_COROUTINE}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_COROUTINE ${CONAN_PKG_LIBS_BOOST_COROUTINE} ${CONAN_SYSTEM_LIBS_BOOST_COROUTINE} ${CONAN_FRAMEWORKS_FOUND_BOOST_COROUTINE})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_COROUTINE ${CONAN_PKG_LIBS_BOOST_COROUTINE} ${CONAN_FRAMEWORKS_FOUND_BOOST_COROUTINE})


set(CONAN_BOOST_DATE_TIME_ROOT "/home/hugo/.conan/data/boost_date_time/1.69.0/bincrafters/stable/package/b91ec170483dcd2bfce52d0eda76e6c781b3a1c7")
set(CONAN_INCLUDE_DIRS_BOOST_DATE_TIME "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/date_time/include")
set(CONAN_LIB_DIRS_BOOST_DATE_TIME "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/date_time/lib")
set(CONAN_BIN_DIRS_BOOST_DATE_TIME "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/date_time/lib")
set(CONAN_RES_DIRS_BOOST_DATE_TIME )
set(CONAN_SRC_DIRS_BOOST_DATE_TIME )
set(CONAN_BUILD_DIRS_BOOST_DATE_TIME "/home/hugo/.conan/data/boost_date_time/1.69.0/bincrafters/stable/package/b91ec170483dcd2bfce52d0eda76e6c781b3a1c7/")
set(CONAN_FRAMEWORK_DIRS_BOOST_DATE_TIME )
set(CONAN_LIBS_BOOST_DATE_TIME boost_date_time)
set(CONAN_PKG_LIBS_BOOST_DATE_TIME boost_date_time)
set(CONAN_SYSTEM_LIBS_BOOST_DATE_TIME )
set(CONAN_FRAMEWORKS_BOOST_DATE_TIME )
set(CONAN_FRAMEWORKS_FOUND_BOOST_DATE_TIME "")  # Will be filled later
set(CONAN_DEFINES_BOOST_DATE_TIME "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_DATE_TIME )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_DATE_TIME "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_DATE_TIME "")
set(CONAN_CXX_FLAGS_BOOST_DATE_TIME "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_DATE_TIME "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_DATE_TIME "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_DATE_TIME_LIST "")
set(CONAN_CXX_FLAGS_BOOST_DATE_TIME_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_DATE_TIME_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_DATE_TIME_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_DATE_TIME "${CONAN_FRAMEWORKS_BOOST_DATE_TIME}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_DATE_TIME ${CONAN_PKG_LIBS_BOOST_DATE_TIME} ${CONAN_SYSTEM_LIBS_BOOST_DATE_TIME} ${CONAN_FRAMEWORKS_FOUND_BOOST_DATE_TIME})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_DATE_TIME ${CONAN_PKG_LIBS_BOOST_DATE_TIME} ${CONAN_FRAMEWORKS_FOUND_BOOST_DATE_TIME})


set(CONAN_LIBPNG_ROOT "/home/hugo/.conan/data/libpng/1.6.34/bincrafters/stable/package/b781af3f476d0aa5070a0a35b544db7a3c193cc8")
set(CONAN_INCLUDE_DIRS_LIBPNG "/home/hugo/.conan/data/libpng/1.6.34/bincrafters/stable/package/b781af3f476d0aa5070a0a35b544db7a3c193cc8/include")
set(CONAN_LIB_DIRS_LIBPNG "/home/hugo/.conan/data/libpng/1.6.34/bincrafters/stable/package/b781af3f476d0aa5070a0a35b544db7a3c193cc8/lib")
set(CONAN_BIN_DIRS_LIBPNG "/home/hugo/.conan/data/libpng/1.6.34/bincrafters/stable/package/b781af3f476d0aa5070a0a35b544db7a3c193cc8/bin")
set(CONAN_RES_DIRS_LIBPNG )
set(CONAN_SRC_DIRS_LIBPNG )
set(CONAN_BUILD_DIRS_LIBPNG "/home/hugo/.conan/data/libpng/1.6.34/bincrafters/stable/package/b781af3f476d0aa5070a0a35b544db7a3c193cc8/")
set(CONAN_FRAMEWORK_DIRS_LIBPNG )
set(CONAN_LIBS_LIBPNG png16 m)
set(CONAN_PKG_LIBS_LIBPNG png16 m)
set(CONAN_SYSTEM_LIBS_LIBPNG )
set(CONAN_FRAMEWORKS_LIBPNG )
set(CONAN_FRAMEWORKS_FOUND_LIBPNG "")  # Will be filled later
set(CONAN_DEFINES_LIBPNG )
set(CONAN_BUILD_MODULES_PATHS_LIBPNG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPNG )

set(CONAN_C_FLAGS_LIBPNG "")
set(CONAN_CXX_FLAGS_LIBPNG "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPNG_LIST "")
set(CONAN_CXX_FLAGS_LIBPNG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPNG "${CONAN_FRAMEWORKS_LIBPNG}")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPNG ${CONAN_PKG_LIBS_LIBPNG} ${CONAN_SYSTEM_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_LIBPNG ${CONAN_PKG_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG})


set(CONAN_LIBALSA_ROOT "/home/hugo/.conan/data/libalsa/1.1.5/conan/stable/package/bff9a7d5ab267a535181ec5b36392417340ff035")
set(CONAN_INCLUDE_DIRS_LIBALSA "/home/hugo/.conan/data/libalsa/1.1.5/conan/stable/package/bff9a7d5ab267a535181ec5b36392417340ff035/include")
set(CONAN_LIB_DIRS_LIBALSA "/home/hugo/.conan/data/libalsa/1.1.5/conan/stable/package/bff9a7d5ab267a535181ec5b36392417340ff035/lib")
set(CONAN_BIN_DIRS_LIBALSA "/home/hugo/.conan/data/libalsa/1.1.5/conan/stable/package/bff9a7d5ab267a535181ec5b36392417340ff035/bin")
set(CONAN_RES_DIRS_LIBALSA )
set(CONAN_SRC_DIRS_LIBALSA )
set(CONAN_BUILD_DIRS_LIBALSA "/home/hugo/.conan/data/libalsa/1.1.5/conan/stable/package/bff9a7d5ab267a535181ec5b36392417340ff035/")
set(CONAN_FRAMEWORK_DIRS_LIBALSA )
set(CONAN_LIBS_LIBALSA asound dl m rt pthread)
set(CONAN_PKG_LIBS_LIBALSA asound dl m rt pthread)
set(CONAN_SYSTEM_LIBS_LIBALSA )
set(CONAN_FRAMEWORKS_LIBALSA )
set(CONAN_FRAMEWORKS_FOUND_LIBALSA "")  # Will be filled later
set(CONAN_DEFINES_LIBALSA )
set(CONAN_BUILD_MODULES_PATHS_LIBALSA )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBALSA )

set(CONAN_C_FLAGS_LIBALSA "")
set(CONAN_CXX_FLAGS_LIBALSA "")
set(CONAN_SHARED_LINKER_FLAGS_LIBALSA "")
set(CONAN_EXE_LINKER_FLAGS_LIBALSA "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBALSA_LIST "")
set(CONAN_CXX_FLAGS_LIBALSA_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBALSA_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBALSA_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBALSA "${CONAN_FRAMEWORKS_LIBALSA}")
# Append to aggregated values variable
set(CONAN_LIBS_LIBALSA ${CONAN_PKG_LIBS_LIBALSA} ${CONAN_SYSTEM_LIBS_LIBALSA} ${CONAN_FRAMEWORKS_FOUND_LIBALSA})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_LIBALSA ${CONAN_PKG_LIBS_LIBALSA} ${CONAN_FRAMEWORKS_FOUND_LIBALSA})


set(CONAN_OGG_ROOT "/home/hugo/.conan/data/ogg/1.3.3/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b")
set(CONAN_INCLUDE_DIRS_OGG "/home/hugo/.conan/data/ogg/1.3.3/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/include")
set(CONAN_LIB_DIRS_OGG "/home/hugo/.conan/data/ogg/1.3.3/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib")
set(CONAN_BIN_DIRS_OGG )
set(CONAN_RES_DIRS_OGG )
set(CONAN_SRC_DIRS_OGG )
set(CONAN_BUILD_DIRS_OGG "/home/hugo/.conan/data/ogg/1.3.3/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/")
set(CONAN_FRAMEWORK_DIRS_OGG )
set(CONAN_LIBS_OGG ogg)
set(CONAN_PKG_LIBS_OGG ogg)
set(CONAN_SYSTEM_LIBS_OGG )
set(CONAN_FRAMEWORKS_OGG )
set(CONAN_FRAMEWORKS_FOUND_OGG "")  # Will be filled later
set(CONAN_DEFINES_OGG )
set(CONAN_BUILD_MODULES_PATHS_OGG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OGG )

set(CONAN_C_FLAGS_OGG "")
set(CONAN_CXX_FLAGS_OGG "")
set(CONAN_SHARED_LINKER_FLAGS_OGG "")
set(CONAN_EXE_LINKER_FLAGS_OGG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OGG_LIST "")
set(CONAN_CXX_FLAGS_OGG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OGG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OGG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OGG "${CONAN_FRAMEWORKS_OGG}")
# Append to aggregated values variable
set(CONAN_LIBS_OGG ${CONAN_PKG_LIBS_OGG} ${CONAN_SYSTEM_LIBS_OGG} ${CONAN_FRAMEWORKS_FOUND_OGG})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_OGG ${CONAN_PKG_LIBS_OGG} ${CONAN_FRAMEWORKS_FOUND_OGG})


set(CONAN_BOOST_CONTEXT_ROOT "/home/hugo/.conan/data/boost_context/1.69.0/bincrafters/stable/package/fdc3c109b752a0f02a0df154e7fd9582761316d2")
set(CONAN_INCLUDE_DIRS_BOOST_CONTEXT "/home/hugo/.conan/data/boost_context/1.69.0/bincrafters/stable/package/fdc3c109b752a0f02a0df154e7fd9582761316d2/context/include")
set(CONAN_LIB_DIRS_BOOST_CONTEXT "/home/hugo/.conan/data/boost_context/1.69.0/bincrafters/stable/package/fdc3c109b752a0f02a0df154e7fd9582761316d2/context/lib")
set(CONAN_BIN_DIRS_BOOST_CONTEXT "/home/hugo/.conan/data/boost_context/1.69.0/bincrafters/stable/package/fdc3c109b752a0f02a0df154e7fd9582761316d2/context/lib")
set(CONAN_RES_DIRS_BOOST_CONTEXT )
set(CONAN_SRC_DIRS_BOOST_CONTEXT )
set(CONAN_BUILD_DIRS_BOOST_CONTEXT "/home/hugo/.conan/data/boost_context/1.69.0/bincrafters/stable/package/fdc3c109b752a0f02a0df154e7fd9582761316d2/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CONTEXT )
set(CONAN_LIBS_BOOST_CONTEXT boost_context)
set(CONAN_PKG_LIBS_BOOST_CONTEXT boost_context)
set(CONAN_SYSTEM_LIBS_BOOST_CONTEXT )
set(CONAN_FRAMEWORKS_BOOST_CONTEXT )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CONTEXT "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CONTEXT "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CONTEXT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CONTEXT "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CONTEXT "")
set(CONAN_CXX_FLAGS_BOOST_CONTEXT "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONTEXT "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONTEXT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CONTEXT_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CONTEXT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONTEXT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONTEXT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CONTEXT "${CONAN_FRAMEWORKS_BOOST_CONTEXT}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CONTEXT ${CONAN_PKG_LIBS_BOOST_CONTEXT} ${CONAN_SYSTEM_LIBS_BOOST_CONTEXT} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONTEXT})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CONTEXT ${CONAN_PKG_LIBS_BOOST_CONTEXT} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONTEXT})


set(CONAN_BOOST_THREAD_ROOT "/home/hugo/.conan/data/boost_thread/1.69.0/bincrafters/stable/package/cb054d0b3e1ca595dc66bc2339d40f1f8f04ab31")
set(CONAN_INCLUDE_DIRS_BOOST_THREAD "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/thread/include")
set(CONAN_LIB_DIRS_BOOST_THREAD "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/thread/lib")
set(CONAN_BIN_DIRS_BOOST_THREAD "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/thread/lib")
set(CONAN_RES_DIRS_BOOST_THREAD )
set(CONAN_SRC_DIRS_BOOST_THREAD )
set(CONAN_BUILD_DIRS_BOOST_THREAD "/home/hugo/.conan/data/boost_thread/1.69.0/bincrafters/stable/package/cb054d0b3e1ca595dc66bc2339d40f1f8f04ab31/")
set(CONAN_FRAMEWORK_DIRS_BOOST_THREAD )
set(CONAN_LIBS_BOOST_THREAD boost_thread rt)
set(CONAN_PKG_LIBS_BOOST_THREAD boost_thread rt)
set(CONAN_SYSTEM_LIBS_BOOST_THREAD )
set(CONAN_FRAMEWORKS_BOOST_THREAD )
set(CONAN_FRAMEWORKS_FOUND_BOOST_THREAD "")  # Will be filled later
set(CONAN_DEFINES_BOOST_THREAD "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_THREAD )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_THREAD "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_THREAD "")
set(CONAN_CXX_FLAGS_BOOST_THREAD "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_THREAD "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_THREAD "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_THREAD_LIST "")
set(CONAN_CXX_FLAGS_BOOST_THREAD_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_THREAD_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_THREAD_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_THREAD "${CONAN_FRAMEWORKS_BOOST_THREAD}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_THREAD ${CONAN_PKG_LIBS_BOOST_THREAD} ${CONAN_SYSTEM_LIBS_BOOST_THREAD} ${CONAN_FRAMEWORKS_FOUND_BOOST_THREAD})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_THREAD ${CONAN_PKG_LIBS_BOOST_THREAD} ${CONAN_FRAMEWORKS_FOUND_BOOST_THREAD})


set(CONAN_BOOST_CYCLE_GROUP_C_ROOT "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940")
set(CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_C "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/date_time/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/dynamic_bitset/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/iostreams/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/multiprecision/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/random/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/serialization/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/spirit/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/thread/include")
set(CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_C "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/date_time/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/dynamic_bitset/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/iostreams/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/multiprecision/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/random/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/serialization/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/spirit/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/thread/lib")
set(CONAN_BIN_DIRS_BOOST_CYCLE_GROUP_C "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/date_time/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/dynamic_bitset/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/iostreams/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/multiprecision/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/random/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/serialization/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/spirit/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/thread/lib")
set(CONAN_RES_DIRS_BOOST_CYCLE_GROUP_C )
set(CONAN_SRC_DIRS_BOOST_CYCLE_GROUP_C )
set(CONAN_BUILD_DIRS_BOOST_CYCLE_GROUP_C "/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CYCLE_GROUP_C )
set(CONAN_LIBS_BOOST_CYCLE_GROUP_C pthread)
set(CONAN_PKG_LIBS_BOOST_CYCLE_GROUP_C pthread)
set(CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_C )
set(CONAN_FRAMEWORKS_BOOST_CYCLE_GROUP_C )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_C "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CYCLE_GROUP_C "-DBOOST_ALL_NO_LIB=1"
			"-DBOOST_IOSTREAMS_USE_BZIP2=1"
			"-DBOOST_IOSTREAMS_USE_ZLIB=1"
			"-DBOOST_IOSTREAMS_USE_LZMA=1"
			"-DBOOST_IOSTREAMS_USE_ZSTD=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CYCLE_GROUP_C )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_C "BOOST_ALL_NO_LIB=1"
			"BOOST_IOSTREAMS_USE_BZIP2=1"
			"BOOST_IOSTREAMS_USE_ZLIB=1"
			"BOOST_IOSTREAMS_USE_LZMA=1"
			"BOOST_IOSTREAMS_USE_ZSTD=1")

set(CONAN_C_FLAGS_BOOST_CYCLE_GROUP_C "")
set(CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_C "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_C "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_C "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CYCLE_GROUP_C_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_C_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_C "${CONAN_FRAMEWORKS_BOOST_CYCLE_GROUP_C}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CYCLE_GROUP_C ${CONAN_PKG_LIBS_BOOST_CYCLE_GROUP_C} ${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_C} ${CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_C})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_C ${CONAN_PKG_LIBS_BOOST_CYCLE_GROUP_C} ${CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_C})


set(CONAN_ZLIB_ROOT "/home/hugo/.conan/data/zlib/1.2.11/conan/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b")
set(CONAN_INCLUDE_DIRS_ZLIB "/home/hugo/.conan/data/zlib/1.2.11/conan/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/include")
set(CONAN_LIB_DIRS_ZLIB "/home/hugo/.conan/data/zlib/1.2.11/conan/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "/home/hugo/.conan/data/zlib/1.2.11/conan/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB z)
set(CONAN_PKG_LIBS_ZLIB z)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


set(CONAN_BZIP2_ROOT "/home/hugo/.conan/data/bzip2/1.0.6/conan/stable/package/b27e2b40bcb70be2e7d6f0e0c6e43e35c530f8d3")
set(CONAN_INCLUDE_DIRS_BZIP2 "/home/hugo/.conan/data/bzip2/1.0.6/conan/stable/package/b27e2b40bcb70be2e7d6f0e0c6e43e35c530f8d3/include")
set(CONAN_LIB_DIRS_BZIP2 "/home/hugo/.conan/data/bzip2/1.0.6/conan/stable/package/b27e2b40bcb70be2e7d6f0e0c6e43e35c530f8d3/lib")
set(CONAN_BIN_DIRS_BZIP2 "/home/hugo/.conan/data/bzip2/1.0.6/conan/stable/package/b27e2b40bcb70be2e7d6f0e0c6e43e35c530f8d3/bin")
set(CONAN_RES_DIRS_BZIP2 )
set(CONAN_SRC_DIRS_BZIP2 )
set(CONAN_BUILD_DIRS_BZIP2 "/home/hugo/.conan/data/bzip2/1.0.6/conan/stable/package/b27e2b40bcb70be2e7d6f0e0c6e43e35c530f8d3/")
set(CONAN_FRAMEWORK_DIRS_BZIP2 )
set(CONAN_LIBS_BZIP2 bz2)
set(CONAN_PKG_LIBS_BZIP2 bz2)
set(CONAN_SYSTEM_LIBS_BZIP2 )
set(CONAN_FRAMEWORKS_BZIP2 )
set(CONAN_FRAMEWORKS_FOUND_BZIP2 "")  # Will be filled later
set(CONAN_DEFINES_BZIP2 )
set(CONAN_BUILD_MODULES_PATHS_BZIP2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BZIP2 )

set(CONAN_C_FLAGS_BZIP2 "")
set(CONAN_CXX_FLAGS_BZIP2 "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2 "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BZIP2_LIST "")
set(CONAN_CXX_FLAGS_BZIP2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BZIP2 "${CONAN_FRAMEWORKS_BZIP2}")
# Append to aggregated values variable
set(CONAN_LIBS_BZIP2 ${CONAN_PKG_LIBS_BZIP2} ${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BZIP2 ${CONAN_PKG_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2})


set(CONAN_BOOST_CHRONO_ROOT "/home/hugo/.conan/data/boost_chrono/1.69.0/bincrafters/stable/package/ce35b0314e3ac4d3bef6c25d378f0ae50b74faee")
set(CONAN_INCLUDE_DIRS_BOOST_CHRONO "/home/hugo/.conan/data/boost_chrono/1.69.0/bincrafters/stable/package/ce35b0314e3ac4d3bef6c25d378f0ae50b74faee/chrono/include")
set(CONAN_LIB_DIRS_BOOST_CHRONO "/home/hugo/.conan/data/boost_chrono/1.69.0/bincrafters/stable/package/ce35b0314e3ac4d3bef6c25d378f0ae50b74faee/chrono/lib")
set(CONAN_BIN_DIRS_BOOST_CHRONO "/home/hugo/.conan/data/boost_chrono/1.69.0/bincrafters/stable/package/ce35b0314e3ac4d3bef6c25d378f0ae50b74faee/chrono/lib")
set(CONAN_RES_DIRS_BOOST_CHRONO )
set(CONAN_SRC_DIRS_BOOST_CHRONO )
set(CONAN_BUILD_DIRS_BOOST_CHRONO "/home/hugo/.conan/data/boost_chrono/1.69.0/bincrafters/stable/package/ce35b0314e3ac4d3bef6c25d378f0ae50b74faee/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CHRONO )
set(CONAN_LIBS_BOOST_CHRONO boost_chrono)
set(CONAN_PKG_LIBS_BOOST_CHRONO boost_chrono)
set(CONAN_SYSTEM_LIBS_BOOST_CHRONO )
set(CONAN_FRAMEWORKS_BOOST_CHRONO )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CHRONO "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CHRONO "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CHRONO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CHRONO "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CHRONO "")
set(CONAN_CXX_FLAGS_BOOST_CHRONO "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CHRONO "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CHRONO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CHRONO_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CHRONO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CHRONO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CHRONO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CHRONO "${CONAN_FRAMEWORKS_BOOST_CHRONO}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CHRONO ${CONAN_PKG_LIBS_BOOST_CHRONO} ${CONAN_SYSTEM_LIBS_BOOST_CHRONO} ${CONAN_FRAMEWORKS_FOUND_BOOST_CHRONO})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CHRONO ${CONAN_PKG_LIBS_BOOST_CHRONO} ${CONAN_FRAMEWORKS_FOUND_BOOST_CHRONO})


set(CONAN_BOOST_POOL_ROOT "/home/hugo/.conan/data/boost_pool/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_POOL "/home/hugo/.conan/data/boost_pool/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/pool/include")
set(CONAN_LIB_DIRS_BOOST_POOL "/home/hugo/.conan/data/boost_pool/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/pool/lib")
set(CONAN_BIN_DIRS_BOOST_POOL "/home/hugo/.conan/data/boost_pool/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/pool/lib")
set(CONAN_RES_DIRS_BOOST_POOL )
set(CONAN_SRC_DIRS_BOOST_POOL )
set(CONAN_BUILD_DIRS_BOOST_POOL "/home/hugo/.conan/data/boost_pool/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_POOL )
set(CONAN_LIBS_BOOST_POOL )
set(CONAN_PKG_LIBS_BOOST_POOL )
set(CONAN_SYSTEM_LIBS_BOOST_POOL )
set(CONAN_FRAMEWORKS_BOOST_POOL )
set(CONAN_FRAMEWORKS_FOUND_BOOST_POOL "")  # Will be filled later
set(CONAN_DEFINES_BOOST_POOL "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_POOL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_POOL "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_POOL "")
set(CONAN_CXX_FLAGS_BOOST_POOL "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_POOL "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_POOL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_POOL_LIST "")
set(CONAN_CXX_FLAGS_BOOST_POOL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_POOL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_POOL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_POOL "${CONAN_FRAMEWORKS_BOOST_POOL}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_POOL ${CONAN_PKG_LIBS_BOOST_POOL} ${CONAN_SYSTEM_LIBS_BOOST_POOL} ${CONAN_FRAMEWORKS_FOUND_BOOST_POOL})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_POOL ${CONAN_PKG_LIBS_BOOST_POOL} ${CONAN_FRAMEWORKS_FOUND_BOOST_POOL})


set(CONAN_BOOST_ALGORITHM_ROOT "/home/hugo/.conan/data/boost_algorithm/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_ALGORITHM "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/algorithm/include")
set(CONAN_LIB_DIRS_BOOST_ALGORITHM "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/algorithm/lib")
set(CONAN_BIN_DIRS_BOOST_ALGORITHM "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/algorithm/lib")
set(CONAN_RES_DIRS_BOOST_ALGORITHM )
set(CONAN_SRC_DIRS_BOOST_ALGORITHM )
set(CONAN_BUILD_DIRS_BOOST_ALGORITHM "/home/hugo/.conan/data/boost_algorithm/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_ALGORITHM )
set(CONAN_LIBS_BOOST_ALGORITHM )
set(CONAN_PKG_LIBS_BOOST_ALGORITHM )
set(CONAN_SYSTEM_LIBS_BOOST_ALGORITHM )
set(CONAN_FRAMEWORKS_BOOST_ALGORITHM )
set(CONAN_FRAMEWORKS_FOUND_BOOST_ALGORITHM "")  # Will be filled later
set(CONAN_DEFINES_BOOST_ALGORITHM "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_ALGORITHM )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_ALGORITHM "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_ALGORITHM "")
set(CONAN_CXX_FLAGS_BOOST_ALGORITHM "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ALGORITHM "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ALGORITHM "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_ALGORITHM_LIST "")
set(CONAN_CXX_FLAGS_BOOST_ALGORITHM_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ALGORITHM_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ALGORITHM_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_ALGORITHM "${CONAN_FRAMEWORKS_BOOST_ALGORITHM}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_ALGORITHM ${CONAN_PKG_LIBS_BOOST_ALGORITHM} ${CONAN_SYSTEM_LIBS_BOOST_ALGORITHM} ${CONAN_FRAMEWORKS_FOUND_BOOST_ALGORITHM})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_ALGORITHM ${CONAN_PKG_LIBS_BOOST_ALGORITHM} ${CONAN_FRAMEWORKS_FOUND_BOOST_ALGORITHM})


set(CONAN_BOOST_ENDIAN_ROOT "/home/hugo/.conan/data/boost_endian/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_ENDIAN "/home/hugo/.conan/data/boost_endian/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/endian/include")
set(CONAN_LIB_DIRS_BOOST_ENDIAN "/home/hugo/.conan/data/boost_endian/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/endian/lib")
set(CONAN_BIN_DIRS_BOOST_ENDIAN "/home/hugo/.conan/data/boost_endian/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/endian/lib")
set(CONAN_RES_DIRS_BOOST_ENDIAN )
set(CONAN_SRC_DIRS_BOOST_ENDIAN )
set(CONAN_BUILD_DIRS_BOOST_ENDIAN "/home/hugo/.conan/data/boost_endian/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_ENDIAN )
set(CONAN_LIBS_BOOST_ENDIAN )
set(CONAN_PKG_LIBS_BOOST_ENDIAN )
set(CONAN_SYSTEM_LIBS_BOOST_ENDIAN )
set(CONAN_FRAMEWORKS_BOOST_ENDIAN )
set(CONAN_FRAMEWORKS_FOUND_BOOST_ENDIAN "")  # Will be filled later
set(CONAN_DEFINES_BOOST_ENDIAN "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_ENDIAN )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_ENDIAN "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_ENDIAN "")
set(CONAN_CXX_FLAGS_BOOST_ENDIAN "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ENDIAN "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ENDIAN "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_ENDIAN_LIST "")
set(CONAN_CXX_FLAGS_BOOST_ENDIAN_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ENDIAN_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ENDIAN_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_ENDIAN "${CONAN_FRAMEWORKS_BOOST_ENDIAN}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_ENDIAN ${CONAN_PKG_LIBS_BOOST_ENDIAN} ${CONAN_SYSTEM_LIBS_BOOST_ENDIAN} ${CONAN_FRAMEWORKS_FOUND_BOOST_ENDIAN})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_ENDIAN ${CONAN_PKG_LIBS_BOOST_ENDIAN} ${CONAN_FRAMEWORKS_FOUND_BOOST_ENDIAN})


set(CONAN_BOOST_FILESYSTEM_ROOT "/home/hugo/.conan/data/boost_filesystem/1.69.0/bincrafters/stable/package/eae29f422477d86464fecbf40168da4935248cce")
set(CONAN_INCLUDE_DIRS_BOOST_FILESYSTEM "/home/hugo/.conan/data/boost_filesystem/1.69.0/bincrafters/stable/package/eae29f422477d86464fecbf40168da4935248cce/filesystem/include")
set(CONAN_LIB_DIRS_BOOST_FILESYSTEM "/home/hugo/.conan/data/boost_filesystem/1.69.0/bincrafters/stable/package/eae29f422477d86464fecbf40168da4935248cce/filesystem/lib")
set(CONAN_BIN_DIRS_BOOST_FILESYSTEM "/home/hugo/.conan/data/boost_filesystem/1.69.0/bincrafters/stable/package/eae29f422477d86464fecbf40168da4935248cce/filesystem/lib")
set(CONAN_RES_DIRS_BOOST_FILESYSTEM )
set(CONAN_SRC_DIRS_BOOST_FILESYSTEM )
set(CONAN_BUILD_DIRS_BOOST_FILESYSTEM "/home/hugo/.conan/data/boost_filesystem/1.69.0/bincrafters/stable/package/eae29f422477d86464fecbf40168da4935248cce/")
set(CONAN_FRAMEWORK_DIRS_BOOST_FILESYSTEM )
set(CONAN_LIBS_BOOST_FILESYSTEM boost_filesystem)
set(CONAN_PKG_LIBS_BOOST_FILESYSTEM boost_filesystem)
set(CONAN_SYSTEM_LIBS_BOOST_FILESYSTEM )
set(CONAN_FRAMEWORKS_BOOST_FILESYSTEM )
set(CONAN_FRAMEWORKS_FOUND_BOOST_FILESYSTEM "")  # Will be filled later
set(CONAN_DEFINES_BOOST_FILESYSTEM "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_FILESYSTEM )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_FILESYSTEM "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_FILESYSTEM "")
set(CONAN_CXX_FLAGS_BOOST_FILESYSTEM "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FILESYSTEM "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FILESYSTEM "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_FILESYSTEM_LIST "")
set(CONAN_CXX_FLAGS_BOOST_FILESYSTEM_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FILESYSTEM_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FILESYSTEM_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_FILESYSTEM "${CONAN_FRAMEWORKS_BOOST_FILESYSTEM}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_FILESYSTEM ${CONAN_PKG_LIBS_BOOST_FILESYSTEM} ${CONAN_SYSTEM_LIBS_BOOST_FILESYSTEM} ${CONAN_FRAMEWORKS_FOUND_BOOST_FILESYSTEM})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_FILESYSTEM ${CONAN_PKG_LIBS_BOOST_FILESYSTEM} ${CONAN_FRAMEWORKS_FOUND_BOOST_FILESYSTEM})


set(CONAN_BOOST_FOREACH_ROOT "/home/hugo/.conan/data/boost_foreach/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_FOREACH "/home/hugo/.conan/data/boost_foreach/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/foreach/include")
set(CONAN_LIB_DIRS_BOOST_FOREACH "/home/hugo/.conan/data/boost_foreach/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/foreach/lib")
set(CONAN_BIN_DIRS_BOOST_FOREACH "/home/hugo/.conan/data/boost_foreach/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/foreach/lib")
set(CONAN_RES_DIRS_BOOST_FOREACH )
set(CONAN_SRC_DIRS_BOOST_FOREACH )
set(CONAN_BUILD_DIRS_BOOST_FOREACH "/home/hugo/.conan/data/boost_foreach/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_FOREACH )
set(CONAN_LIBS_BOOST_FOREACH )
set(CONAN_PKG_LIBS_BOOST_FOREACH )
set(CONAN_SYSTEM_LIBS_BOOST_FOREACH )
set(CONAN_FRAMEWORKS_BOOST_FOREACH )
set(CONAN_FRAMEWORKS_FOUND_BOOST_FOREACH "")  # Will be filled later
set(CONAN_DEFINES_BOOST_FOREACH "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_FOREACH )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_FOREACH "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_FOREACH "")
set(CONAN_CXX_FLAGS_BOOST_FOREACH "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FOREACH "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FOREACH "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_FOREACH_LIST "")
set(CONAN_CXX_FLAGS_BOOST_FOREACH_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FOREACH_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FOREACH_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_FOREACH "${CONAN_FRAMEWORKS_BOOST_FOREACH}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_FOREACH ${CONAN_PKG_LIBS_BOOST_FOREACH} ${CONAN_SYSTEM_LIBS_BOOST_FOREACH} ${CONAN_FRAMEWORKS_FOUND_BOOST_FOREACH})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_FOREACH ${CONAN_PKG_LIBS_BOOST_FOREACH} ${CONAN_FRAMEWORKS_FOUND_BOOST_FOREACH})


set(CONAN_BOOST_LEXICAL_CAST_ROOT "/home/hugo/.conan/data/boost_lexical_cast/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_LEXICAL_CAST "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/lexical_cast/include")
set(CONAN_LIB_DIRS_BOOST_LEXICAL_CAST "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/lexical_cast/lib")
set(CONAN_BIN_DIRS_BOOST_LEXICAL_CAST "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/lexical_cast/lib")
set(CONAN_RES_DIRS_BOOST_LEXICAL_CAST )
set(CONAN_SRC_DIRS_BOOST_LEXICAL_CAST )
set(CONAN_BUILD_DIRS_BOOST_LEXICAL_CAST "/home/hugo/.conan/data/boost_lexical_cast/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_LEXICAL_CAST )
set(CONAN_LIBS_BOOST_LEXICAL_CAST )
set(CONAN_PKG_LIBS_BOOST_LEXICAL_CAST )
set(CONAN_SYSTEM_LIBS_BOOST_LEXICAL_CAST )
set(CONAN_FRAMEWORKS_BOOST_LEXICAL_CAST )
set(CONAN_FRAMEWORKS_FOUND_BOOST_LEXICAL_CAST "")  # Will be filled later
set(CONAN_DEFINES_BOOST_LEXICAL_CAST "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_LEXICAL_CAST )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_LEXICAL_CAST "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_LEXICAL_CAST "")
set(CONAN_CXX_FLAGS_BOOST_LEXICAL_CAST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_LEXICAL_CAST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_LEXICAL_CAST "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_LEXICAL_CAST_LIST "")
set(CONAN_CXX_FLAGS_BOOST_LEXICAL_CAST_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_LEXICAL_CAST_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_LEXICAL_CAST_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_LEXICAL_CAST "${CONAN_FRAMEWORKS_BOOST_LEXICAL_CAST}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_LEXICAL_CAST ${CONAN_PKG_LIBS_BOOST_LEXICAL_CAST} ${CONAN_SYSTEM_LIBS_BOOST_LEXICAL_CAST} ${CONAN_FRAMEWORKS_FOUND_BOOST_LEXICAL_CAST})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_LEXICAL_CAST ${CONAN_PKG_LIBS_BOOST_LEXICAL_CAST} ${CONAN_FRAMEWORKS_FOUND_BOOST_LEXICAL_CAST})


set(CONAN_BOOST_LOCALE_ROOT "/home/hugo/.conan/data/boost_locale/1.69.0/bincrafters/stable/package/e71e34ac7b5ccfea2103ad478158f6be7d1aabb6")
set(CONAN_INCLUDE_DIRS_BOOST_LOCALE "/home/hugo/.conan/data/boost_locale/1.69.0/bincrafters/stable/package/e71e34ac7b5ccfea2103ad478158f6be7d1aabb6/locale/include")
set(CONAN_LIB_DIRS_BOOST_LOCALE "/home/hugo/.conan/data/boost_locale/1.69.0/bincrafters/stable/package/e71e34ac7b5ccfea2103ad478158f6be7d1aabb6/locale/lib")
set(CONAN_BIN_DIRS_BOOST_LOCALE "/home/hugo/.conan/data/boost_locale/1.69.0/bincrafters/stable/package/e71e34ac7b5ccfea2103ad478158f6be7d1aabb6/locale/lib")
set(CONAN_RES_DIRS_BOOST_LOCALE )
set(CONAN_SRC_DIRS_BOOST_LOCALE )
set(CONAN_BUILD_DIRS_BOOST_LOCALE "/home/hugo/.conan/data/boost_locale/1.69.0/bincrafters/stable/package/e71e34ac7b5ccfea2103ad478158f6be7d1aabb6/")
set(CONAN_FRAMEWORK_DIRS_BOOST_LOCALE )
set(CONAN_LIBS_BOOST_LOCALE boost_locale)
set(CONAN_PKG_LIBS_BOOST_LOCALE boost_locale)
set(CONAN_SYSTEM_LIBS_BOOST_LOCALE )
set(CONAN_FRAMEWORKS_BOOST_LOCALE )
set(CONAN_FRAMEWORKS_FOUND_BOOST_LOCALE "")  # Will be filled later
set(CONAN_DEFINES_BOOST_LOCALE "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_LOCALE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_LOCALE "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_LOCALE "")
set(CONAN_CXX_FLAGS_BOOST_LOCALE "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_LOCALE "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_LOCALE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_LOCALE_LIST "")
set(CONAN_CXX_FLAGS_BOOST_LOCALE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_LOCALE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_LOCALE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_LOCALE "${CONAN_FRAMEWORKS_BOOST_LOCALE}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_LOCALE ${CONAN_PKG_LIBS_BOOST_LOCALE} ${CONAN_SYSTEM_LIBS_BOOST_LOCALE} ${CONAN_FRAMEWORKS_FOUND_BOOST_LOCALE})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_LOCALE ${CONAN_PKG_LIBS_BOOST_LOCALE} ${CONAN_FRAMEWORKS_FOUND_BOOST_LOCALE})


set(CONAN_BOOST_MATH_ROOT "/home/hugo/.conan/data/boost_math/1.69.0/bincrafters/stable/package/0ceee36be9ea061ef9d0599085570de73b3ccf97")
set(CONAN_INCLUDE_DIRS_BOOST_MATH "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/math/include")
set(CONAN_LIB_DIRS_BOOST_MATH "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/math/lib")
set(CONAN_BIN_DIRS_BOOST_MATH "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/math/lib")
set(CONAN_RES_DIRS_BOOST_MATH )
set(CONAN_SRC_DIRS_BOOST_MATH )
set(CONAN_BUILD_DIRS_BOOST_MATH "/home/hugo/.conan/data/boost_math/1.69.0/bincrafters/stable/package/0ceee36be9ea061ef9d0599085570de73b3ccf97/")
set(CONAN_FRAMEWORK_DIRS_BOOST_MATH )
set(CONAN_LIBS_BOOST_MATH boost_math_tr1 boost_math_tr1l boost_math_c99l boost_math_tr1f boost_math_c99f boost_math_c99)
set(CONAN_PKG_LIBS_BOOST_MATH boost_math_tr1 boost_math_tr1l boost_math_c99l boost_math_tr1f boost_math_c99f boost_math_c99)
set(CONAN_SYSTEM_LIBS_BOOST_MATH )
set(CONAN_FRAMEWORKS_BOOST_MATH )
set(CONAN_FRAMEWORKS_FOUND_BOOST_MATH "")  # Will be filled later
set(CONAN_DEFINES_BOOST_MATH "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_MATH )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_MATH "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_MATH "")
set(CONAN_CXX_FLAGS_BOOST_MATH "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_MATH "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_MATH "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_MATH_LIST "")
set(CONAN_CXX_FLAGS_BOOST_MATH_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_MATH_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_MATH_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_MATH "${CONAN_FRAMEWORKS_BOOST_MATH}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_MATH ${CONAN_PKG_LIBS_BOOST_MATH} ${CONAN_SYSTEM_LIBS_BOOST_MATH} ${CONAN_FRAMEWORKS_FOUND_BOOST_MATH})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_MATH ${CONAN_PKG_LIBS_BOOST_MATH} ${CONAN_FRAMEWORKS_FOUND_BOOST_MATH})


set(CONAN_BOOST_PHOENIX_ROOT "/home/hugo/.conan/data/boost_phoenix/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_PHOENIX "/home/hugo/.conan/data/boost_phoenix/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/phoenix/include")
set(CONAN_LIB_DIRS_BOOST_PHOENIX "/home/hugo/.conan/data/boost_phoenix/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/phoenix/lib")
set(CONAN_BIN_DIRS_BOOST_PHOENIX "/home/hugo/.conan/data/boost_phoenix/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/phoenix/lib")
set(CONAN_RES_DIRS_BOOST_PHOENIX )
set(CONAN_SRC_DIRS_BOOST_PHOENIX )
set(CONAN_BUILD_DIRS_BOOST_PHOENIX "/home/hugo/.conan/data/boost_phoenix/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_PHOENIX )
set(CONAN_LIBS_BOOST_PHOENIX )
set(CONAN_PKG_LIBS_BOOST_PHOENIX )
set(CONAN_SYSTEM_LIBS_BOOST_PHOENIX )
set(CONAN_FRAMEWORKS_BOOST_PHOENIX )
set(CONAN_FRAMEWORKS_FOUND_BOOST_PHOENIX "")  # Will be filled later
set(CONAN_DEFINES_BOOST_PHOENIX "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_PHOENIX )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_PHOENIX "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_PHOENIX "")
set(CONAN_CXX_FLAGS_BOOST_PHOENIX "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_PHOENIX "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_PHOENIX "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_PHOENIX_LIST "")
set(CONAN_CXX_FLAGS_BOOST_PHOENIX_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_PHOENIX_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_PHOENIX_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_PHOENIX "${CONAN_FRAMEWORKS_BOOST_PHOENIX}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_PHOENIX ${CONAN_PKG_LIBS_BOOST_PHOENIX} ${CONAN_SYSTEM_LIBS_BOOST_PHOENIX} ${CONAN_FRAMEWORKS_FOUND_BOOST_PHOENIX})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_PHOENIX ${CONAN_PKG_LIBS_BOOST_PHOENIX} ${CONAN_FRAMEWORKS_FOUND_BOOST_PHOENIX})


set(CONAN_BOOST_TOKENIZER_ROOT "/home/hugo/.conan/data/boost_tokenizer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_TOKENIZER "/home/hugo/.conan/data/boost_tokenizer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tokenizer/include")
set(CONAN_LIB_DIRS_BOOST_TOKENIZER "/home/hugo/.conan/data/boost_tokenizer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tokenizer/lib")
set(CONAN_BIN_DIRS_BOOST_TOKENIZER "/home/hugo/.conan/data/boost_tokenizer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tokenizer/lib")
set(CONAN_RES_DIRS_BOOST_TOKENIZER )
set(CONAN_SRC_DIRS_BOOST_TOKENIZER )
set(CONAN_BUILD_DIRS_BOOST_TOKENIZER "/home/hugo/.conan/data/boost_tokenizer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_TOKENIZER )
set(CONAN_LIBS_BOOST_TOKENIZER )
set(CONAN_PKG_LIBS_BOOST_TOKENIZER )
set(CONAN_SYSTEM_LIBS_BOOST_TOKENIZER )
set(CONAN_FRAMEWORKS_BOOST_TOKENIZER )
set(CONAN_FRAMEWORKS_FOUND_BOOST_TOKENIZER "")  # Will be filled later
set(CONAN_DEFINES_BOOST_TOKENIZER "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_TOKENIZER )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_TOKENIZER "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_TOKENIZER "")
set(CONAN_CXX_FLAGS_BOOST_TOKENIZER "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TOKENIZER "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TOKENIZER "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_TOKENIZER_LIST "")
set(CONAN_CXX_FLAGS_BOOST_TOKENIZER_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TOKENIZER_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TOKENIZER_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_TOKENIZER "${CONAN_FRAMEWORKS_BOOST_TOKENIZER}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_TOKENIZER ${CONAN_PKG_LIBS_BOOST_TOKENIZER} ${CONAN_SYSTEM_LIBS_BOOST_TOKENIZER} ${CONAN_FRAMEWORKS_FOUND_BOOST_TOKENIZER})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_TOKENIZER ${CONAN_PKG_LIBS_BOOST_TOKENIZER} ${CONAN_FRAMEWORKS_FOUND_BOOST_TOKENIZER})


set(CONAN_BOOST_TTI_ROOT "/home/hugo/.conan/data/boost_tti/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_TTI "/home/hugo/.conan/data/boost_tti/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tti/include")
set(CONAN_LIB_DIRS_BOOST_TTI "/home/hugo/.conan/data/boost_tti/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tti/lib")
set(CONAN_BIN_DIRS_BOOST_TTI "/home/hugo/.conan/data/boost_tti/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tti/lib")
set(CONAN_RES_DIRS_BOOST_TTI )
set(CONAN_SRC_DIRS_BOOST_TTI )
set(CONAN_BUILD_DIRS_BOOST_TTI "/home/hugo/.conan/data/boost_tti/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_TTI )
set(CONAN_LIBS_BOOST_TTI )
set(CONAN_PKG_LIBS_BOOST_TTI )
set(CONAN_SYSTEM_LIBS_BOOST_TTI )
set(CONAN_FRAMEWORKS_BOOST_TTI )
set(CONAN_FRAMEWORKS_FOUND_BOOST_TTI "")  # Will be filled later
set(CONAN_DEFINES_BOOST_TTI "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_TTI )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_TTI "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_TTI "")
set(CONAN_CXX_FLAGS_BOOST_TTI "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TTI "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TTI "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_TTI_LIST "")
set(CONAN_CXX_FLAGS_BOOST_TTI_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TTI_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TTI_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_TTI "${CONAN_FRAMEWORKS_BOOST_TTI}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_TTI ${CONAN_PKG_LIBS_BOOST_TTI} ${CONAN_SYSTEM_LIBS_BOOST_TTI} ${CONAN_FRAMEWORKS_FOUND_BOOST_TTI})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_TTI ${CONAN_PKG_LIBS_BOOST_TTI} ${CONAN_FRAMEWORKS_FOUND_BOOST_TTI})


set(CONAN_BOOST_VARIANT_ROOT "/home/hugo/.conan/data/boost_variant/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_VARIANT "/home/hugo/.conan/data/boost_variant/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/variant/include")
set(CONAN_LIB_DIRS_BOOST_VARIANT "/home/hugo/.conan/data/boost_variant/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/variant/lib")
set(CONAN_BIN_DIRS_BOOST_VARIANT "/home/hugo/.conan/data/boost_variant/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/variant/lib")
set(CONAN_RES_DIRS_BOOST_VARIANT )
set(CONAN_SRC_DIRS_BOOST_VARIANT )
set(CONAN_BUILD_DIRS_BOOST_VARIANT "/home/hugo/.conan/data/boost_variant/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_VARIANT )
set(CONAN_LIBS_BOOST_VARIANT )
set(CONAN_PKG_LIBS_BOOST_VARIANT )
set(CONAN_SYSTEM_LIBS_BOOST_VARIANT )
set(CONAN_FRAMEWORKS_BOOST_VARIANT )
set(CONAN_FRAMEWORKS_FOUND_BOOST_VARIANT "")  # Will be filled later
set(CONAN_DEFINES_BOOST_VARIANT "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_VARIANT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_VARIANT "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_VARIANT "")
set(CONAN_CXX_FLAGS_BOOST_VARIANT "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_VARIANT "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_VARIANT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_VARIANT_LIST "")
set(CONAN_CXX_FLAGS_BOOST_VARIANT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_VARIANT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_VARIANT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_VARIANT "${CONAN_FRAMEWORKS_BOOST_VARIANT}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_VARIANT ${CONAN_PKG_LIBS_BOOST_VARIANT} ${CONAN_SYSTEM_LIBS_BOOST_VARIANT} ${CONAN_FRAMEWORKS_FOUND_BOOST_VARIANT})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_VARIANT ${CONAN_PKG_LIBS_BOOST_VARIANT} ${CONAN_FRAMEWORKS_FOUND_BOOST_VARIANT})


set(CONAN_LZMA_ROOT "/home/hugo/.conan/data/lzma/5.2.4/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b")
set(CONAN_INCLUDE_DIRS_LZMA "/home/hugo/.conan/data/lzma/5.2.4/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/include")
set(CONAN_LIB_DIRS_LZMA "/home/hugo/.conan/data/lzma/5.2.4/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib")
set(CONAN_BIN_DIRS_LZMA )
set(CONAN_RES_DIRS_LZMA )
set(CONAN_SRC_DIRS_LZMA )
set(CONAN_BUILD_DIRS_LZMA "/home/hugo/.conan/data/lzma/5.2.4/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_LZMA )
set(CONAN_LIBS_LZMA lzma)
set(CONAN_PKG_LIBS_LZMA lzma)
set(CONAN_SYSTEM_LIBS_LZMA )
set(CONAN_FRAMEWORKS_LZMA )
set(CONAN_FRAMEWORKS_FOUND_LZMA "")  # Will be filled later
set(CONAN_DEFINES_LZMA "-DLZMA_API_STATIC")
set(CONAN_BUILD_MODULES_PATHS_LZMA )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LZMA "LZMA_API_STATIC")

set(CONAN_C_FLAGS_LZMA "")
set(CONAN_CXX_FLAGS_LZMA "")
set(CONAN_SHARED_LINKER_FLAGS_LZMA "")
set(CONAN_EXE_LINKER_FLAGS_LZMA "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LZMA_LIST "")
set(CONAN_CXX_FLAGS_LZMA_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LZMA_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LZMA_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LZMA "${CONAN_FRAMEWORKS_LZMA}")
# Append to aggregated values variable
set(CONAN_LIBS_LZMA ${CONAN_PKG_LIBS_LZMA} ${CONAN_SYSTEM_LIBS_LZMA} ${CONAN_FRAMEWORKS_FOUND_LZMA})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_LZMA ${CONAN_PKG_LIBS_LZMA} ${CONAN_FRAMEWORKS_FOUND_LZMA})


set(CONAN_ZSTD_ROOT "/home/hugo/.conan/data/zstd/1.3.5/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b")
set(CONAN_INCLUDE_DIRS_ZSTD "/home/hugo/.conan/data/zstd/1.3.5/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/include")
set(CONAN_LIB_DIRS_ZSTD "/home/hugo/.conan/data/zstd/1.3.5/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib")
set(CONAN_BIN_DIRS_ZSTD )
set(CONAN_RES_DIRS_ZSTD )
set(CONAN_SRC_DIRS_ZSTD )
set(CONAN_BUILD_DIRS_ZSTD "/home/hugo/.conan/data/zstd/1.3.5/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/")
set(CONAN_FRAMEWORK_DIRS_ZSTD )
set(CONAN_LIBS_ZSTD zstd pthread)
set(CONAN_PKG_LIBS_ZSTD zstd pthread)
set(CONAN_SYSTEM_LIBS_ZSTD )
set(CONAN_FRAMEWORKS_ZSTD )
set(CONAN_FRAMEWORKS_FOUND_ZSTD "")  # Will be filled later
set(CONAN_DEFINES_ZSTD )
set(CONAN_BUILD_MODULES_PATHS_ZSTD )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZSTD )

set(CONAN_C_FLAGS_ZSTD "")
set(CONAN_CXX_FLAGS_ZSTD "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZSTD_LIST "")
set(CONAN_CXX_FLAGS_ZSTD_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZSTD "${CONAN_FRAMEWORKS_ZSTD}")
# Append to aggregated values variable
set(CONAN_LIBS_ZSTD ${CONAN_PKG_LIBS_ZSTD} ${CONAN_SYSTEM_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_ZSTD ${CONAN_PKG_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD})


set(CONAN_BOOST_RATIO_ROOT "/home/hugo/.conan/data/boost_ratio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_RATIO "/home/hugo/.conan/data/boost_ratio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/ratio/include")
set(CONAN_LIB_DIRS_BOOST_RATIO "/home/hugo/.conan/data/boost_ratio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/ratio/lib")
set(CONAN_BIN_DIRS_BOOST_RATIO "/home/hugo/.conan/data/boost_ratio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/ratio/lib")
set(CONAN_RES_DIRS_BOOST_RATIO )
set(CONAN_SRC_DIRS_BOOST_RATIO )
set(CONAN_BUILD_DIRS_BOOST_RATIO "/home/hugo/.conan/data/boost_ratio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_RATIO )
set(CONAN_LIBS_BOOST_RATIO )
set(CONAN_PKG_LIBS_BOOST_RATIO )
set(CONAN_SYSTEM_LIBS_BOOST_RATIO )
set(CONAN_FRAMEWORKS_BOOST_RATIO )
set(CONAN_FRAMEWORKS_FOUND_BOOST_RATIO "")  # Will be filled later
set(CONAN_DEFINES_BOOST_RATIO "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_RATIO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_RATIO "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_RATIO "")
set(CONAN_CXX_FLAGS_BOOST_RATIO "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_RATIO "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_RATIO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_RATIO_LIST "")
set(CONAN_CXX_FLAGS_BOOST_RATIO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_RATIO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_RATIO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_RATIO "${CONAN_FRAMEWORKS_BOOST_RATIO}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_RATIO ${CONAN_PKG_LIBS_BOOST_RATIO} ${CONAN_SYSTEM_LIBS_BOOST_RATIO} ${CONAN_FRAMEWORKS_FOUND_BOOST_RATIO})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_RATIO ${CONAN_PKG_LIBS_BOOST_RATIO} ${CONAN_FRAMEWORKS_FOUND_BOOST_RATIO})


set(CONAN_BOOST_SYSTEM_ROOT "/home/hugo/.conan/data/boost_system/1.69.0/bincrafters/stable/package/663b6ae87778ab67e3abf1b0e1db7bbd5c0a1794")
set(CONAN_INCLUDE_DIRS_BOOST_SYSTEM "/home/hugo/.conan/data/boost_system/1.69.0/bincrafters/stable/package/663b6ae87778ab67e3abf1b0e1db7bbd5c0a1794/system/include")
set(CONAN_LIB_DIRS_BOOST_SYSTEM "/home/hugo/.conan/data/boost_system/1.69.0/bincrafters/stable/package/663b6ae87778ab67e3abf1b0e1db7bbd5c0a1794/system/lib")
set(CONAN_BIN_DIRS_BOOST_SYSTEM "/home/hugo/.conan/data/boost_system/1.69.0/bincrafters/stable/package/663b6ae87778ab67e3abf1b0e1db7bbd5c0a1794/system/lib")
set(CONAN_RES_DIRS_BOOST_SYSTEM )
set(CONAN_SRC_DIRS_BOOST_SYSTEM )
set(CONAN_BUILD_DIRS_BOOST_SYSTEM "/home/hugo/.conan/data/boost_system/1.69.0/bincrafters/stable/package/663b6ae87778ab67e3abf1b0e1db7bbd5c0a1794/")
set(CONAN_FRAMEWORK_DIRS_BOOST_SYSTEM )
set(CONAN_LIBS_BOOST_SYSTEM boost_system)
set(CONAN_PKG_LIBS_BOOST_SYSTEM boost_system)
set(CONAN_SYSTEM_LIBS_BOOST_SYSTEM )
set(CONAN_FRAMEWORKS_BOOST_SYSTEM )
set(CONAN_FRAMEWORKS_FOUND_BOOST_SYSTEM "")  # Will be filled later
set(CONAN_DEFINES_BOOST_SYSTEM "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_SYSTEM )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_SYSTEM "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_SYSTEM "")
set(CONAN_CXX_FLAGS_BOOST_SYSTEM "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_SYSTEM "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_SYSTEM "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_SYSTEM_LIST "")
set(CONAN_CXX_FLAGS_BOOST_SYSTEM_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_SYSTEM_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_SYSTEM_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_SYSTEM "${CONAN_FRAMEWORKS_BOOST_SYSTEM}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_SYSTEM ${CONAN_PKG_LIBS_BOOST_SYSTEM} ${CONAN_SYSTEM_LIBS_BOOST_SYSTEM} ${CONAN_FRAMEWORKS_FOUND_BOOST_SYSTEM})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_SYSTEM ${CONAN_PKG_LIBS_BOOST_SYSTEM} ${CONAN_FRAMEWORKS_FOUND_BOOST_SYSTEM})


set(CONAN_BOOST_IO_ROOT "/home/hugo/.conan/data/boost_io/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_IO "/home/hugo/.conan/data/boost_io/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/io/include")
set(CONAN_LIB_DIRS_BOOST_IO "/home/hugo/.conan/data/boost_io/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/io/lib")
set(CONAN_BIN_DIRS_BOOST_IO "/home/hugo/.conan/data/boost_io/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/io/lib")
set(CONAN_RES_DIRS_BOOST_IO )
set(CONAN_SRC_DIRS_BOOST_IO )
set(CONAN_BUILD_DIRS_BOOST_IO "/home/hugo/.conan/data/boost_io/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_IO )
set(CONAN_LIBS_BOOST_IO )
set(CONAN_PKG_LIBS_BOOST_IO )
set(CONAN_SYSTEM_LIBS_BOOST_IO )
set(CONAN_FRAMEWORKS_BOOST_IO )
set(CONAN_FRAMEWORKS_FOUND_BOOST_IO "")  # Will be filled later
set(CONAN_DEFINES_BOOST_IO "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_IO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_IO "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_IO "")
set(CONAN_CXX_FLAGS_BOOST_IO "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_IO "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_IO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_IO_LIST "")
set(CONAN_CXX_FLAGS_BOOST_IO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_IO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_IO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_IO "${CONAN_FRAMEWORKS_BOOST_IO}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_IO ${CONAN_PKG_LIBS_BOOST_IO} ${CONAN_SYSTEM_LIBS_BOOST_IO} ${CONAN_FRAMEWORKS_FOUND_BOOST_IO})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_IO ${CONAN_PKG_LIBS_BOOST_IO} ${CONAN_FRAMEWORKS_FOUND_BOOST_IO})


set(CONAN_BOOST_CYCLE_GROUP_B_ROOT "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa")
set(CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_B "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/lexical_cast/include"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/math/include")
set(CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_B "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/lexical_cast/lib"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/math/lib")
set(CONAN_BIN_DIRS_BOOST_CYCLE_GROUP_B "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/lexical_cast/lib"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/math/lib")
set(CONAN_RES_DIRS_BOOST_CYCLE_GROUP_B )
set(CONAN_SRC_DIRS_BOOST_CYCLE_GROUP_B )
set(CONAN_BUILD_DIRS_BOOST_CYCLE_GROUP_B "/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CYCLE_GROUP_B )
set(CONAN_LIBS_BOOST_CYCLE_GROUP_B )
set(CONAN_PKG_LIBS_BOOST_CYCLE_GROUP_B )
set(CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_B )
set(CONAN_FRAMEWORKS_BOOST_CYCLE_GROUP_B )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_B "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CYCLE_GROUP_B "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CYCLE_GROUP_B )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_B "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CYCLE_GROUP_B "")
set(CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_B "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_B "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_B "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CYCLE_GROUP_B_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_B_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_B "${CONAN_FRAMEWORKS_BOOST_CYCLE_GROUP_B}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CYCLE_GROUP_B ${CONAN_PKG_LIBS_BOOST_CYCLE_GROUP_B} ${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_B} ${CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_B})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_B ${CONAN_PKG_LIBS_BOOST_CYCLE_GROUP_B} ${CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_B})


set(CONAN_BOOST_PROTO_ROOT "/home/hugo/.conan/data/boost_proto/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_PROTO "/home/hugo/.conan/data/boost_proto/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/proto/include")
set(CONAN_LIB_DIRS_BOOST_PROTO "/home/hugo/.conan/data/boost_proto/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/proto/lib")
set(CONAN_BIN_DIRS_BOOST_PROTO "/home/hugo/.conan/data/boost_proto/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/proto/lib")
set(CONAN_RES_DIRS_BOOST_PROTO )
set(CONAN_SRC_DIRS_BOOST_PROTO )
set(CONAN_BUILD_DIRS_BOOST_PROTO "/home/hugo/.conan/data/boost_proto/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_PROTO )
set(CONAN_LIBS_BOOST_PROTO )
set(CONAN_PKG_LIBS_BOOST_PROTO )
set(CONAN_SYSTEM_LIBS_BOOST_PROTO )
set(CONAN_FRAMEWORKS_BOOST_PROTO )
set(CONAN_FRAMEWORKS_FOUND_BOOST_PROTO "")  # Will be filled later
set(CONAN_DEFINES_BOOST_PROTO "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_PROTO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_PROTO "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_PROTO "")
set(CONAN_CXX_FLAGS_BOOST_PROTO "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_PROTO "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_PROTO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_PROTO_LIST "")
set(CONAN_CXX_FLAGS_BOOST_PROTO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_PROTO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_PROTO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_PROTO "${CONAN_FRAMEWORKS_BOOST_PROTO}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_PROTO ${CONAN_PKG_LIBS_BOOST_PROTO} ${CONAN_SYSTEM_LIBS_BOOST_PROTO} ${CONAN_FRAMEWORKS_FOUND_BOOST_PROTO})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_PROTO ${CONAN_PKG_LIBS_BOOST_PROTO} ${CONAN_FRAMEWORKS_FOUND_BOOST_PROTO})


set(CONAN_BOOST_RATIONAL_ROOT "/home/hugo/.conan/data/boost_rational/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_RATIONAL "/home/hugo/.conan/data/boost_rational/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/rational/include")
set(CONAN_LIB_DIRS_BOOST_RATIONAL "/home/hugo/.conan/data/boost_rational/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/rational/lib")
set(CONAN_BIN_DIRS_BOOST_RATIONAL "/home/hugo/.conan/data/boost_rational/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/rational/lib")
set(CONAN_RES_DIRS_BOOST_RATIONAL )
set(CONAN_SRC_DIRS_BOOST_RATIONAL )
set(CONAN_BUILD_DIRS_BOOST_RATIONAL "/home/hugo/.conan/data/boost_rational/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_RATIONAL )
set(CONAN_LIBS_BOOST_RATIONAL )
set(CONAN_PKG_LIBS_BOOST_RATIONAL )
set(CONAN_SYSTEM_LIBS_BOOST_RATIONAL )
set(CONAN_FRAMEWORKS_BOOST_RATIONAL )
set(CONAN_FRAMEWORKS_FOUND_BOOST_RATIONAL "")  # Will be filled later
set(CONAN_DEFINES_BOOST_RATIONAL "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_RATIONAL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_RATIONAL "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_RATIONAL "")
set(CONAN_CXX_FLAGS_BOOST_RATIONAL "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_RATIONAL "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_RATIONAL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_RATIONAL_LIST "")
set(CONAN_CXX_FLAGS_BOOST_RATIONAL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_RATIONAL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_RATIONAL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_RATIONAL "${CONAN_FRAMEWORKS_BOOST_RATIONAL}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_RATIONAL ${CONAN_PKG_LIBS_BOOST_RATIONAL} ${CONAN_SYSTEM_LIBS_BOOST_RATIONAL} ${CONAN_FRAMEWORKS_FOUND_BOOST_RATIONAL})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_RATIONAL ${CONAN_PKG_LIBS_BOOST_RATIONAL} ${CONAN_FRAMEWORKS_FOUND_BOOST_RATIONAL})


set(CONAN_BOOST_WINAPI_ROOT "/home/hugo/.conan/data/boost_winapi/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_WINAPI "/home/hugo/.conan/data/boost_winapi/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/winapi/include")
set(CONAN_LIB_DIRS_BOOST_WINAPI "/home/hugo/.conan/data/boost_winapi/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/winapi/lib")
set(CONAN_BIN_DIRS_BOOST_WINAPI "/home/hugo/.conan/data/boost_winapi/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/winapi/lib")
set(CONAN_RES_DIRS_BOOST_WINAPI )
set(CONAN_SRC_DIRS_BOOST_WINAPI )
set(CONAN_BUILD_DIRS_BOOST_WINAPI "/home/hugo/.conan/data/boost_winapi/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_WINAPI )
set(CONAN_LIBS_BOOST_WINAPI )
set(CONAN_PKG_LIBS_BOOST_WINAPI )
set(CONAN_SYSTEM_LIBS_BOOST_WINAPI )
set(CONAN_FRAMEWORKS_BOOST_WINAPI )
set(CONAN_FRAMEWORKS_FOUND_BOOST_WINAPI "")  # Will be filled later
set(CONAN_DEFINES_BOOST_WINAPI "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_WINAPI )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_WINAPI "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_WINAPI "")
set(CONAN_CXX_FLAGS_BOOST_WINAPI "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_WINAPI "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_WINAPI "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_WINAPI_LIST "")
set(CONAN_CXX_FLAGS_BOOST_WINAPI_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_WINAPI_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_WINAPI_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_WINAPI "${CONAN_FRAMEWORKS_BOOST_WINAPI}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_WINAPI ${CONAN_PKG_LIBS_BOOST_WINAPI} ${CONAN_SYSTEM_LIBS_BOOST_WINAPI} ${CONAN_FRAMEWORKS_FOUND_BOOST_WINAPI})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_WINAPI ${CONAN_PKG_LIBS_BOOST_WINAPI} ${CONAN_FRAMEWORKS_FOUND_BOOST_WINAPI})


set(CONAN_BOOST_ATOMIC_ROOT "/home/hugo/.conan/data/boost_atomic/1.69.0/bincrafters/stable/package/80d4553e807857a762eb0f64781d0625c1b0ad72")
set(CONAN_INCLUDE_DIRS_BOOST_ATOMIC "/home/hugo/.conan/data/boost_atomic/1.69.0/bincrafters/stable/package/80d4553e807857a762eb0f64781d0625c1b0ad72/atomic/include")
set(CONAN_LIB_DIRS_BOOST_ATOMIC "/home/hugo/.conan/data/boost_atomic/1.69.0/bincrafters/stable/package/80d4553e807857a762eb0f64781d0625c1b0ad72/atomic/lib")
set(CONAN_BIN_DIRS_BOOST_ATOMIC "/home/hugo/.conan/data/boost_atomic/1.69.0/bincrafters/stable/package/80d4553e807857a762eb0f64781d0625c1b0ad72/atomic/lib")
set(CONAN_RES_DIRS_BOOST_ATOMIC )
set(CONAN_SRC_DIRS_BOOST_ATOMIC )
set(CONAN_BUILD_DIRS_BOOST_ATOMIC "/home/hugo/.conan/data/boost_atomic/1.69.0/bincrafters/stable/package/80d4553e807857a762eb0f64781d0625c1b0ad72/")
set(CONAN_FRAMEWORK_DIRS_BOOST_ATOMIC )
set(CONAN_LIBS_BOOST_ATOMIC boost_atomic)
set(CONAN_PKG_LIBS_BOOST_ATOMIC boost_atomic)
set(CONAN_SYSTEM_LIBS_BOOST_ATOMIC )
set(CONAN_FRAMEWORKS_BOOST_ATOMIC )
set(CONAN_FRAMEWORKS_FOUND_BOOST_ATOMIC "")  # Will be filled later
set(CONAN_DEFINES_BOOST_ATOMIC "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_ATOMIC )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_ATOMIC "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_ATOMIC "")
set(CONAN_CXX_FLAGS_BOOST_ATOMIC "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ATOMIC "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ATOMIC "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_ATOMIC_LIST "")
set(CONAN_CXX_FLAGS_BOOST_ATOMIC_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ATOMIC_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ATOMIC_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_ATOMIC "${CONAN_FRAMEWORKS_BOOST_ATOMIC}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_ATOMIC ${CONAN_PKG_LIBS_BOOST_ATOMIC} ${CONAN_SYSTEM_LIBS_BOOST_ATOMIC} ${CONAN_FRAMEWORKS_FOUND_BOOST_ATOMIC})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_ATOMIC ${CONAN_PKG_LIBS_BOOST_ATOMIC} ${CONAN_FRAMEWORKS_FOUND_BOOST_ATOMIC})


set(CONAN_BOOST_RANGE_ROOT "/home/hugo/.conan/data/boost_range/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_RANGE "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/range/include")
set(CONAN_LIB_DIRS_BOOST_RANGE "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/range/lib")
set(CONAN_BIN_DIRS_BOOST_RANGE "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/range/lib")
set(CONAN_RES_DIRS_BOOST_RANGE )
set(CONAN_SRC_DIRS_BOOST_RANGE )
set(CONAN_BUILD_DIRS_BOOST_RANGE "/home/hugo/.conan/data/boost_range/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_RANGE )
set(CONAN_LIBS_BOOST_RANGE )
set(CONAN_PKG_LIBS_BOOST_RANGE )
set(CONAN_SYSTEM_LIBS_BOOST_RANGE )
set(CONAN_FRAMEWORKS_BOOST_RANGE )
set(CONAN_FRAMEWORKS_FOUND_BOOST_RANGE "")  # Will be filled later
set(CONAN_DEFINES_BOOST_RANGE "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_RANGE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_RANGE "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_RANGE "")
set(CONAN_CXX_FLAGS_BOOST_RANGE "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_RANGE "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_RANGE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_RANGE_LIST "")
set(CONAN_CXX_FLAGS_BOOST_RANGE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_RANGE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_RANGE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_RANGE "${CONAN_FRAMEWORKS_BOOST_RANGE}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_RANGE ${CONAN_PKG_LIBS_BOOST_RANGE} ${CONAN_SYSTEM_LIBS_BOOST_RANGE} ${CONAN_FRAMEWORKS_FOUND_BOOST_RANGE})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_RANGE ${CONAN_PKG_LIBS_BOOST_RANGE} ${CONAN_FRAMEWORKS_FOUND_BOOST_RANGE})


set(CONAN_BOOST_LAMBDA_ROOT "/home/hugo/.conan/data/boost_lambda/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_LAMBDA "/home/hugo/.conan/data/boost_lambda/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lambda/include")
set(CONAN_LIB_DIRS_BOOST_LAMBDA "/home/hugo/.conan/data/boost_lambda/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lambda/lib")
set(CONAN_BIN_DIRS_BOOST_LAMBDA "/home/hugo/.conan/data/boost_lambda/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lambda/lib")
set(CONAN_RES_DIRS_BOOST_LAMBDA )
set(CONAN_SRC_DIRS_BOOST_LAMBDA )
set(CONAN_BUILD_DIRS_BOOST_LAMBDA "/home/hugo/.conan/data/boost_lambda/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_LAMBDA )
set(CONAN_LIBS_BOOST_LAMBDA )
set(CONAN_PKG_LIBS_BOOST_LAMBDA )
set(CONAN_SYSTEM_LIBS_BOOST_LAMBDA )
set(CONAN_FRAMEWORKS_BOOST_LAMBDA )
set(CONAN_FRAMEWORKS_FOUND_BOOST_LAMBDA "")  # Will be filled later
set(CONAN_DEFINES_BOOST_LAMBDA "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_LAMBDA )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_LAMBDA "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_LAMBDA "")
set(CONAN_CXX_FLAGS_BOOST_LAMBDA "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_LAMBDA "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_LAMBDA "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_LAMBDA_LIST "")
set(CONAN_CXX_FLAGS_BOOST_LAMBDA_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_LAMBDA_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_LAMBDA_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_LAMBDA "${CONAN_FRAMEWORKS_BOOST_LAMBDA}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_LAMBDA ${CONAN_PKG_LIBS_BOOST_LAMBDA} ${CONAN_SYSTEM_LIBS_BOOST_LAMBDA} ${CONAN_FRAMEWORKS_FOUND_BOOST_LAMBDA})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_LAMBDA ${CONAN_PKG_LIBS_BOOST_LAMBDA} ${CONAN_FRAMEWORKS_FOUND_BOOST_LAMBDA})


set(CONAN_BOOST_CYCLE_GROUP_A_ROOT "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444")
set(CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_A "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/algorithm/include"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/range/include")
set(CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_A "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/algorithm/lib"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/range/lib")
set(CONAN_BIN_DIRS_BOOST_CYCLE_GROUP_A "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/algorithm/lib"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/range/lib")
set(CONAN_RES_DIRS_BOOST_CYCLE_GROUP_A )
set(CONAN_SRC_DIRS_BOOST_CYCLE_GROUP_A )
set(CONAN_BUILD_DIRS_BOOST_CYCLE_GROUP_A "/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CYCLE_GROUP_A )
set(CONAN_LIBS_BOOST_CYCLE_GROUP_A )
set(CONAN_PKG_LIBS_BOOST_CYCLE_GROUP_A )
set(CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_A )
set(CONAN_FRAMEWORKS_BOOST_CYCLE_GROUP_A )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_A "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CYCLE_GROUP_A "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CYCLE_GROUP_A )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_A "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CYCLE_GROUP_A "")
set(CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_A "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_A "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_A "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CYCLE_GROUP_A_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_A_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_A "${CONAN_FRAMEWORKS_BOOST_CYCLE_GROUP_A}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CYCLE_GROUP_A ${CONAN_PKG_LIBS_BOOST_CYCLE_GROUP_A} ${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_A} ${CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_A})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_A ${CONAN_PKG_LIBS_BOOST_CYCLE_GROUP_A} ${CONAN_FRAMEWORKS_FOUND_BOOST_CYCLE_GROUP_A})


set(CONAN_BOOST_ARRAY_ROOT "/home/hugo/.conan/data/boost_array/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_ARRAY "/home/hugo/.conan/data/boost_array/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/array/include")
set(CONAN_LIB_DIRS_BOOST_ARRAY "/home/hugo/.conan/data/boost_array/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/array/lib")
set(CONAN_BIN_DIRS_BOOST_ARRAY "/home/hugo/.conan/data/boost_array/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/array/lib")
set(CONAN_RES_DIRS_BOOST_ARRAY )
set(CONAN_SRC_DIRS_BOOST_ARRAY )
set(CONAN_BUILD_DIRS_BOOST_ARRAY "/home/hugo/.conan/data/boost_array/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_ARRAY )
set(CONAN_LIBS_BOOST_ARRAY )
set(CONAN_PKG_LIBS_BOOST_ARRAY )
set(CONAN_SYSTEM_LIBS_BOOST_ARRAY )
set(CONAN_FRAMEWORKS_BOOST_ARRAY )
set(CONAN_FRAMEWORKS_FOUND_BOOST_ARRAY "")  # Will be filled later
set(CONAN_DEFINES_BOOST_ARRAY "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_ARRAY )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_ARRAY "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_ARRAY "")
set(CONAN_CXX_FLAGS_BOOST_ARRAY "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ARRAY "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ARRAY "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_ARRAY_LIST "")
set(CONAN_CXX_FLAGS_BOOST_ARRAY_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ARRAY_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ARRAY_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_ARRAY "${CONAN_FRAMEWORKS_BOOST_ARRAY}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_ARRAY ${CONAN_PKG_LIBS_BOOST_ARRAY} ${CONAN_SYSTEM_LIBS_BOOST_ARRAY} ${CONAN_FRAMEWORKS_FOUND_BOOST_ARRAY})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_ARRAY ${CONAN_PKG_LIBS_BOOST_ARRAY} ${CONAN_FRAMEWORKS_FOUND_BOOST_ARRAY})


set(CONAN_BOOST_EXCEPTION_ROOT "/home/hugo/.conan/data/boost_exception/1.69.0/bincrafters/stable/package/a2b0f38cd477002de46eaedcab7fafd540d3be0a")
set(CONAN_INCLUDE_DIRS_BOOST_EXCEPTION "/home/hugo/.conan/data/boost_exception/1.69.0/bincrafters/stable/package/a2b0f38cd477002de46eaedcab7fafd540d3be0a/exception/include")
set(CONAN_LIB_DIRS_BOOST_EXCEPTION "/home/hugo/.conan/data/boost_exception/1.69.0/bincrafters/stable/package/a2b0f38cd477002de46eaedcab7fafd540d3be0a/exception/lib")
set(CONAN_BIN_DIRS_BOOST_EXCEPTION "/home/hugo/.conan/data/boost_exception/1.69.0/bincrafters/stable/package/a2b0f38cd477002de46eaedcab7fafd540d3be0a/exception/lib")
set(CONAN_RES_DIRS_BOOST_EXCEPTION )
set(CONAN_SRC_DIRS_BOOST_EXCEPTION )
set(CONAN_BUILD_DIRS_BOOST_EXCEPTION "/home/hugo/.conan/data/boost_exception/1.69.0/bincrafters/stable/package/a2b0f38cd477002de46eaedcab7fafd540d3be0a/")
set(CONAN_FRAMEWORK_DIRS_BOOST_EXCEPTION )
set(CONAN_LIBS_BOOST_EXCEPTION boost_exception)
set(CONAN_PKG_LIBS_BOOST_EXCEPTION boost_exception)
set(CONAN_SYSTEM_LIBS_BOOST_EXCEPTION )
set(CONAN_FRAMEWORKS_BOOST_EXCEPTION )
set(CONAN_FRAMEWORKS_FOUND_BOOST_EXCEPTION "")  # Will be filled later
set(CONAN_DEFINES_BOOST_EXCEPTION "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_EXCEPTION )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_EXCEPTION "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_EXCEPTION "")
set(CONAN_CXX_FLAGS_BOOST_EXCEPTION "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_EXCEPTION "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_EXCEPTION "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_EXCEPTION_LIST "")
set(CONAN_CXX_FLAGS_BOOST_EXCEPTION_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_EXCEPTION_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_EXCEPTION_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_EXCEPTION "${CONAN_FRAMEWORKS_BOOST_EXCEPTION}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_EXCEPTION ${CONAN_PKG_LIBS_BOOST_EXCEPTION} ${CONAN_SYSTEM_LIBS_BOOST_EXCEPTION} ${CONAN_FRAMEWORKS_FOUND_BOOST_EXCEPTION})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_EXCEPTION ${CONAN_PKG_LIBS_BOOST_EXCEPTION} ${CONAN_FRAMEWORKS_FOUND_BOOST_EXCEPTION})


set(CONAN_BOOST_FUNCTION_ROOT "/home/hugo/.conan/data/boost_function/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_FUNCTION "/home/hugo/.conan/data/boost_function/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function/include")
set(CONAN_LIB_DIRS_BOOST_FUNCTION "/home/hugo/.conan/data/boost_function/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function/lib")
set(CONAN_BIN_DIRS_BOOST_FUNCTION "/home/hugo/.conan/data/boost_function/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function/lib")
set(CONAN_RES_DIRS_BOOST_FUNCTION )
set(CONAN_SRC_DIRS_BOOST_FUNCTION )
set(CONAN_BUILD_DIRS_BOOST_FUNCTION "/home/hugo/.conan/data/boost_function/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_FUNCTION )
set(CONAN_LIBS_BOOST_FUNCTION )
set(CONAN_PKG_LIBS_BOOST_FUNCTION )
set(CONAN_SYSTEM_LIBS_BOOST_FUNCTION )
set(CONAN_FRAMEWORKS_BOOST_FUNCTION )
set(CONAN_FRAMEWORKS_FOUND_BOOST_FUNCTION "")  # Will be filled later
set(CONAN_DEFINES_BOOST_FUNCTION "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_FUNCTION )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_FUNCTION "")
set(CONAN_CXX_FLAGS_BOOST_FUNCTION "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_FUNCTION_LIST "")
set(CONAN_CXX_FLAGS_BOOST_FUNCTION_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_FUNCTION "${CONAN_FRAMEWORKS_BOOST_FUNCTION}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_FUNCTION ${CONAN_PKG_LIBS_BOOST_FUNCTION} ${CONAN_SYSTEM_LIBS_BOOST_FUNCTION} ${CONAN_FRAMEWORKS_FOUND_BOOST_FUNCTION})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION ${CONAN_PKG_LIBS_BOOST_FUNCTION} ${CONAN_FRAMEWORKS_FOUND_BOOST_FUNCTION})


set(CONAN_BOOST_NUMERIC_CONVERSION_ROOT "/home/hugo/.conan/data/boost_numeric_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_NUMERIC_CONVERSION "/home/hugo/.conan/data/boost_numeric_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/numeric_conversion/include")
set(CONAN_LIB_DIRS_BOOST_NUMERIC_CONVERSION "/home/hugo/.conan/data/boost_numeric_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/numeric_conversion/lib")
set(CONAN_BIN_DIRS_BOOST_NUMERIC_CONVERSION "/home/hugo/.conan/data/boost_numeric_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/numeric_conversion/lib")
set(CONAN_RES_DIRS_BOOST_NUMERIC_CONVERSION )
set(CONAN_SRC_DIRS_BOOST_NUMERIC_CONVERSION )
set(CONAN_BUILD_DIRS_BOOST_NUMERIC_CONVERSION "/home/hugo/.conan/data/boost_numeric_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_NUMERIC_CONVERSION )
set(CONAN_LIBS_BOOST_NUMERIC_CONVERSION )
set(CONAN_PKG_LIBS_BOOST_NUMERIC_CONVERSION )
set(CONAN_SYSTEM_LIBS_BOOST_NUMERIC_CONVERSION )
set(CONAN_FRAMEWORKS_BOOST_NUMERIC_CONVERSION )
set(CONAN_FRAMEWORKS_FOUND_BOOST_NUMERIC_CONVERSION "")  # Will be filled later
set(CONAN_DEFINES_BOOST_NUMERIC_CONVERSION "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_NUMERIC_CONVERSION )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_NUMERIC_CONVERSION "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_NUMERIC_CONVERSION "")
set(CONAN_CXX_FLAGS_BOOST_NUMERIC_CONVERSION "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_NUMERIC_CONVERSION_LIST "")
set(CONAN_CXX_FLAGS_BOOST_NUMERIC_CONVERSION_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_NUMERIC_CONVERSION "${CONAN_FRAMEWORKS_BOOST_NUMERIC_CONVERSION}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_NUMERIC_CONVERSION ${CONAN_PKG_LIBS_BOOST_NUMERIC_CONVERSION} ${CONAN_SYSTEM_LIBS_BOOST_NUMERIC_CONVERSION} ${CONAN_FRAMEWORKS_FOUND_BOOST_NUMERIC_CONVERSION})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_NUMERIC_CONVERSION ${CONAN_PKG_LIBS_BOOST_NUMERIC_CONVERSION} ${CONAN_FRAMEWORKS_FOUND_BOOST_NUMERIC_CONVERSION})


set(CONAN_BOOST_REGEX_ROOT "/home/hugo/.conan/data/boost_regex/1.69.0/bincrafters/stable/package/02dfd2e024018d0d9493b40e3cb73694b7182084")
set(CONAN_INCLUDE_DIRS_BOOST_REGEX "/home/hugo/.conan/data/boost_regex/1.69.0/bincrafters/stable/package/02dfd2e024018d0d9493b40e3cb73694b7182084/regex/include")
set(CONAN_LIB_DIRS_BOOST_REGEX "/home/hugo/.conan/data/boost_regex/1.69.0/bincrafters/stable/package/02dfd2e024018d0d9493b40e3cb73694b7182084/regex/lib")
set(CONAN_BIN_DIRS_BOOST_REGEX "/home/hugo/.conan/data/boost_regex/1.69.0/bincrafters/stable/package/02dfd2e024018d0d9493b40e3cb73694b7182084/regex/lib")
set(CONAN_RES_DIRS_BOOST_REGEX )
set(CONAN_SRC_DIRS_BOOST_REGEX )
set(CONAN_BUILD_DIRS_BOOST_REGEX "/home/hugo/.conan/data/boost_regex/1.69.0/bincrafters/stable/package/02dfd2e024018d0d9493b40e3cb73694b7182084/")
set(CONAN_FRAMEWORK_DIRS_BOOST_REGEX )
set(CONAN_LIBS_BOOST_REGEX boost_regex)
set(CONAN_PKG_LIBS_BOOST_REGEX boost_regex)
set(CONAN_SYSTEM_LIBS_BOOST_REGEX )
set(CONAN_FRAMEWORKS_BOOST_REGEX )
set(CONAN_FRAMEWORKS_FOUND_BOOST_REGEX "")  # Will be filled later
set(CONAN_DEFINES_BOOST_REGEX "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_REGEX )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_REGEX "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_REGEX "")
set(CONAN_CXX_FLAGS_BOOST_REGEX "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_REGEX "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_REGEX "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_REGEX_LIST "")
set(CONAN_CXX_FLAGS_BOOST_REGEX_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_REGEX_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_REGEX_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_REGEX "${CONAN_FRAMEWORKS_BOOST_REGEX}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_REGEX ${CONAN_PKG_LIBS_BOOST_REGEX} ${CONAN_SYSTEM_LIBS_BOOST_REGEX} ${CONAN_FRAMEWORKS_FOUND_BOOST_REGEX})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_REGEX ${CONAN_PKG_LIBS_BOOST_REGEX} ${CONAN_FRAMEWORKS_FOUND_BOOST_REGEX})


set(CONAN_BOOST_UNORDERED_ROOT "/home/hugo/.conan/data/boost_unordered/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_UNORDERED "/home/hugo/.conan/data/boost_unordered/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/unordered/include")
set(CONAN_LIB_DIRS_BOOST_UNORDERED "/home/hugo/.conan/data/boost_unordered/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/unordered/lib")
set(CONAN_BIN_DIRS_BOOST_UNORDERED "/home/hugo/.conan/data/boost_unordered/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/unordered/lib")
set(CONAN_RES_DIRS_BOOST_UNORDERED )
set(CONAN_SRC_DIRS_BOOST_UNORDERED )
set(CONAN_BUILD_DIRS_BOOST_UNORDERED "/home/hugo/.conan/data/boost_unordered/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_UNORDERED )
set(CONAN_LIBS_BOOST_UNORDERED )
set(CONAN_PKG_LIBS_BOOST_UNORDERED )
set(CONAN_SYSTEM_LIBS_BOOST_UNORDERED )
set(CONAN_FRAMEWORKS_BOOST_UNORDERED )
set(CONAN_FRAMEWORKS_FOUND_BOOST_UNORDERED "")  # Will be filled later
set(CONAN_DEFINES_BOOST_UNORDERED "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_UNORDERED )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_UNORDERED "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_UNORDERED "")
set(CONAN_CXX_FLAGS_BOOST_UNORDERED "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_UNORDERED "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_UNORDERED "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_UNORDERED_LIST "")
set(CONAN_CXX_FLAGS_BOOST_UNORDERED_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_UNORDERED_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_UNORDERED_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_UNORDERED "${CONAN_FRAMEWORKS_BOOST_UNORDERED}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_UNORDERED ${CONAN_PKG_LIBS_BOOST_UNORDERED} ${CONAN_SYSTEM_LIBS_BOOST_UNORDERED} ${CONAN_FRAMEWORKS_FOUND_BOOST_UNORDERED})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_UNORDERED ${CONAN_PKG_LIBS_BOOST_UNORDERED} ${CONAN_FRAMEWORKS_FOUND_BOOST_UNORDERED})


set(CONAN_BOOST_BIND_ROOT "/home/hugo/.conan/data/boost_bind/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_BIND "/home/hugo/.conan/data/boost_bind/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/bind/include")
set(CONAN_LIB_DIRS_BOOST_BIND "/home/hugo/.conan/data/boost_bind/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/bind/lib")
set(CONAN_BIN_DIRS_BOOST_BIND "/home/hugo/.conan/data/boost_bind/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/bind/lib")
set(CONAN_RES_DIRS_BOOST_BIND )
set(CONAN_SRC_DIRS_BOOST_BIND )
set(CONAN_BUILD_DIRS_BOOST_BIND "/home/hugo/.conan/data/boost_bind/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_BIND )
set(CONAN_LIBS_BOOST_BIND )
set(CONAN_PKG_LIBS_BOOST_BIND )
set(CONAN_SYSTEM_LIBS_BOOST_BIND )
set(CONAN_FRAMEWORKS_BOOST_BIND )
set(CONAN_FRAMEWORKS_FOUND_BOOST_BIND "")  # Will be filled later
set(CONAN_DEFINES_BOOST_BIND "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_BIND )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_BIND "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_BIND "")
set(CONAN_CXX_FLAGS_BOOST_BIND "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_BIND "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_BIND "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_BIND_LIST "")
set(CONAN_CXX_FLAGS_BOOST_BIND_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_BIND_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_BIND_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_BIND "${CONAN_FRAMEWORKS_BOOST_BIND}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_BIND ${CONAN_PKG_LIBS_BOOST_BIND} ${CONAN_SYSTEM_LIBS_BOOST_BIND} ${CONAN_FRAMEWORKS_FOUND_BOOST_BIND})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_BIND ${CONAN_PKG_LIBS_BOOST_BIND} ${CONAN_FRAMEWORKS_FOUND_BOOST_BIND})


set(CONAN_BOOST_TYPE_INDEX_ROOT "/home/hugo/.conan/data/boost_type_index/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_TYPE_INDEX "/home/hugo/.conan/data/boost_type_index/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_index/include")
set(CONAN_LIB_DIRS_BOOST_TYPE_INDEX "/home/hugo/.conan/data/boost_type_index/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_index/lib")
set(CONAN_BIN_DIRS_BOOST_TYPE_INDEX "/home/hugo/.conan/data/boost_type_index/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_index/lib")
set(CONAN_RES_DIRS_BOOST_TYPE_INDEX )
set(CONAN_SRC_DIRS_BOOST_TYPE_INDEX )
set(CONAN_BUILD_DIRS_BOOST_TYPE_INDEX "/home/hugo/.conan/data/boost_type_index/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_TYPE_INDEX )
set(CONAN_LIBS_BOOST_TYPE_INDEX )
set(CONAN_PKG_LIBS_BOOST_TYPE_INDEX )
set(CONAN_SYSTEM_LIBS_BOOST_TYPE_INDEX )
set(CONAN_FRAMEWORKS_BOOST_TYPE_INDEX )
set(CONAN_FRAMEWORKS_FOUND_BOOST_TYPE_INDEX "")  # Will be filled later
set(CONAN_DEFINES_BOOST_TYPE_INDEX "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_TYPE_INDEX )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_INDEX "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_TYPE_INDEX "")
set(CONAN_CXX_FLAGS_BOOST_TYPE_INDEX "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_INDEX "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_INDEX "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_TYPE_INDEX_LIST "")
set(CONAN_CXX_FLAGS_BOOST_TYPE_INDEX_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_INDEX_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_INDEX_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_TYPE_INDEX "${CONAN_FRAMEWORKS_BOOST_TYPE_INDEX}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_TYPE_INDEX ${CONAN_PKG_LIBS_BOOST_TYPE_INDEX} ${CONAN_SYSTEM_LIBS_BOOST_TYPE_INDEX} ${CONAN_FRAMEWORKS_FOUND_BOOST_TYPE_INDEX})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_INDEX ${CONAN_PKG_LIBS_BOOST_TYPE_INDEX} ${CONAN_FRAMEWORKS_FOUND_BOOST_TYPE_INDEX})


set(CONAN_BOOST_ITERATOR_ROOT "/home/hugo/.conan/data/boost_iterator/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_ITERATOR "/home/hugo/.conan/data/boost_iterator/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/iterator/include")
set(CONAN_LIB_DIRS_BOOST_ITERATOR "/home/hugo/.conan/data/boost_iterator/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/iterator/lib")
set(CONAN_BIN_DIRS_BOOST_ITERATOR "/home/hugo/.conan/data/boost_iterator/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/iterator/lib")
set(CONAN_RES_DIRS_BOOST_ITERATOR )
set(CONAN_SRC_DIRS_BOOST_ITERATOR )
set(CONAN_BUILD_DIRS_BOOST_ITERATOR "/home/hugo/.conan/data/boost_iterator/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_ITERATOR )
set(CONAN_LIBS_BOOST_ITERATOR )
set(CONAN_PKG_LIBS_BOOST_ITERATOR )
set(CONAN_SYSTEM_LIBS_BOOST_ITERATOR )
set(CONAN_FRAMEWORKS_BOOST_ITERATOR )
set(CONAN_FRAMEWORKS_FOUND_BOOST_ITERATOR "")  # Will be filled later
set(CONAN_DEFINES_BOOST_ITERATOR "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_ITERATOR )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_ITERATOR "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_ITERATOR "")
set(CONAN_CXX_FLAGS_BOOST_ITERATOR "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ITERATOR "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ITERATOR "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_ITERATOR_LIST "")
set(CONAN_CXX_FLAGS_BOOST_ITERATOR_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ITERATOR_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ITERATOR_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_ITERATOR "${CONAN_FRAMEWORKS_BOOST_ITERATOR}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_ITERATOR ${CONAN_PKG_LIBS_BOOST_ITERATOR} ${CONAN_SYSTEM_LIBS_BOOST_ITERATOR} ${CONAN_FRAMEWORKS_FOUND_BOOST_ITERATOR})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_ITERATOR ${CONAN_PKG_LIBS_BOOST_ITERATOR} ${CONAN_FRAMEWORKS_FOUND_BOOST_ITERATOR})


set(CONAN_BOOST_CONTAINER_ROOT "/home/hugo/.conan/data/boost_container/1.69.0/bincrafters/stable/package/14cb647d789b7ccacc6b582166c87fbb1aeb68ca")
set(CONAN_INCLUDE_DIRS_BOOST_CONTAINER "/home/hugo/.conan/data/boost_container/1.69.0/bincrafters/stable/package/14cb647d789b7ccacc6b582166c87fbb1aeb68ca/container/include")
set(CONAN_LIB_DIRS_BOOST_CONTAINER "/home/hugo/.conan/data/boost_container/1.69.0/bincrafters/stable/package/14cb647d789b7ccacc6b582166c87fbb1aeb68ca/container/lib")
set(CONAN_BIN_DIRS_BOOST_CONTAINER "/home/hugo/.conan/data/boost_container/1.69.0/bincrafters/stable/package/14cb647d789b7ccacc6b582166c87fbb1aeb68ca/container/lib")
set(CONAN_RES_DIRS_BOOST_CONTAINER )
set(CONAN_SRC_DIRS_BOOST_CONTAINER )
set(CONAN_BUILD_DIRS_BOOST_CONTAINER "/home/hugo/.conan/data/boost_container/1.69.0/bincrafters/stable/package/14cb647d789b7ccacc6b582166c87fbb1aeb68ca/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CONTAINER )
set(CONAN_LIBS_BOOST_CONTAINER boost_container)
set(CONAN_PKG_LIBS_BOOST_CONTAINER boost_container)
set(CONAN_SYSTEM_LIBS_BOOST_CONTAINER )
set(CONAN_FRAMEWORKS_BOOST_CONTAINER )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CONTAINER "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CONTAINER "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CONTAINER )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CONTAINER "")
set(CONAN_CXX_FLAGS_BOOST_CONTAINER "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CONTAINER_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CONTAINER_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CONTAINER "${CONAN_FRAMEWORKS_BOOST_CONTAINER}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CONTAINER ${CONAN_PKG_LIBS_BOOST_CONTAINER} ${CONAN_SYSTEM_LIBS_BOOST_CONTAINER} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONTAINER})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER ${CONAN_PKG_LIBS_BOOST_CONTAINER} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONTAINER})


set(CONAN_BOOST_CONCEPT_CHECK_ROOT "/home/hugo/.conan/data/boost_concept_check/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_CONCEPT_CHECK "/home/hugo/.conan/data/boost_concept_check/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/concept_check/include")
set(CONAN_LIB_DIRS_BOOST_CONCEPT_CHECK "/home/hugo/.conan/data/boost_concept_check/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/concept_check/lib")
set(CONAN_BIN_DIRS_BOOST_CONCEPT_CHECK "/home/hugo/.conan/data/boost_concept_check/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/concept_check/lib")
set(CONAN_RES_DIRS_BOOST_CONCEPT_CHECK )
set(CONAN_SRC_DIRS_BOOST_CONCEPT_CHECK )
set(CONAN_BUILD_DIRS_BOOST_CONCEPT_CHECK "/home/hugo/.conan/data/boost_concept_check/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CONCEPT_CHECK )
set(CONAN_LIBS_BOOST_CONCEPT_CHECK )
set(CONAN_PKG_LIBS_BOOST_CONCEPT_CHECK )
set(CONAN_SYSTEM_LIBS_BOOST_CONCEPT_CHECK )
set(CONAN_FRAMEWORKS_BOOST_CONCEPT_CHECK )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CONCEPT_CHECK "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CONCEPT_CHECK "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CONCEPT_CHECK )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CONCEPT_CHECK "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CONCEPT_CHECK "")
set(CONAN_CXX_FLAGS_BOOST_CONCEPT_CHECK "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONCEPT_CHECK "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONCEPT_CHECK "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CONCEPT_CHECK_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CONCEPT_CHECK_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONCEPT_CHECK_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONCEPT_CHECK_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CONCEPT_CHECK "${CONAN_FRAMEWORKS_BOOST_CONCEPT_CHECK}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CONCEPT_CHECK ${CONAN_PKG_LIBS_BOOST_CONCEPT_CHECK} ${CONAN_SYSTEM_LIBS_BOOST_CONCEPT_CHECK} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONCEPT_CHECK})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CONCEPT_CHECK ${CONAN_PKG_LIBS_BOOST_CONCEPT_CHECK} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONCEPT_CHECK})


set(CONAN_BOOST_CONVERSION_ROOT "/home/hugo/.conan/data/boost_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_CONVERSION "/home/hugo/.conan/data/boost_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/conversion/include")
set(CONAN_LIB_DIRS_BOOST_CONVERSION "/home/hugo/.conan/data/boost_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/conversion/lib")
set(CONAN_BIN_DIRS_BOOST_CONVERSION "/home/hugo/.conan/data/boost_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/conversion/lib")
set(CONAN_RES_DIRS_BOOST_CONVERSION )
set(CONAN_SRC_DIRS_BOOST_CONVERSION )
set(CONAN_BUILD_DIRS_BOOST_CONVERSION "/home/hugo/.conan/data/boost_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CONVERSION )
set(CONAN_LIBS_BOOST_CONVERSION )
set(CONAN_PKG_LIBS_BOOST_CONVERSION )
set(CONAN_SYSTEM_LIBS_BOOST_CONVERSION )
set(CONAN_FRAMEWORKS_BOOST_CONVERSION )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CONVERSION "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CONVERSION "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CONVERSION )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CONVERSION "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CONVERSION "")
set(CONAN_CXX_FLAGS_BOOST_CONVERSION "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONVERSION "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONVERSION "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CONVERSION_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CONVERSION_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONVERSION_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONVERSION_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CONVERSION "${CONAN_FRAMEWORKS_BOOST_CONVERSION}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CONVERSION ${CONAN_PKG_LIBS_BOOST_CONVERSION} ${CONAN_SYSTEM_LIBS_BOOST_CONVERSION} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONVERSION})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CONVERSION ${CONAN_PKG_LIBS_BOOST_CONVERSION} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONVERSION})


set(CONAN_BOOST_FUSION_ROOT "/home/hugo/.conan/data/boost_fusion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_FUSION "/home/hugo/.conan/data/boost_fusion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/fusion/include")
set(CONAN_LIB_DIRS_BOOST_FUSION "/home/hugo/.conan/data/boost_fusion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/fusion/lib")
set(CONAN_BIN_DIRS_BOOST_FUSION "/home/hugo/.conan/data/boost_fusion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/fusion/lib")
set(CONAN_RES_DIRS_BOOST_FUSION )
set(CONAN_SRC_DIRS_BOOST_FUSION )
set(CONAN_BUILD_DIRS_BOOST_FUSION "/home/hugo/.conan/data/boost_fusion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_FUSION )
set(CONAN_LIBS_BOOST_FUSION )
set(CONAN_PKG_LIBS_BOOST_FUSION )
set(CONAN_SYSTEM_LIBS_BOOST_FUSION )
set(CONAN_FRAMEWORKS_BOOST_FUSION )
set(CONAN_FRAMEWORKS_FOUND_BOOST_FUSION "")  # Will be filled later
set(CONAN_DEFINES_BOOST_FUSION "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_FUSION )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_FUSION "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_FUSION "")
set(CONAN_CXX_FLAGS_BOOST_FUSION "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FUSION "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FUSION "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_FUSION_LIST "")
set(CONAN_CXX_FLAGS_BOOST_FUSION_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FUSION_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FUSION_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_FUSION "${CONAN_FRAMEWORKS_BOOST_FUSION}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_FUSION ${CONAN_PKG_LIBS_BOOST_FUSION} ${CONAN_SYSTEM_LIBS_BOOST_FUSION} ${CONAN_FRAMEWORKS_FOUND_BOOST_FUSION})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_FUSION ${CONAN_PKG_LIBS_BOOST_FUSION} ${CONAN_FRAMEWORKS_FOUND_BOOST_FUSION})


set(CONAN_BOOST_OPTIONAL_ROOT "/home/hugo/.conan/data/boost_optional/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_OPTIONAL "/home/hugo/.conan/data/boost_optional/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/optional/include")
set(CONAN_LIB_DIRS_BOOST_OPTIONAL "/home/hugo/.conan/data/boost_optional/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/optional/lib")
set(CONAN_BIN_DIRS_BOOST_OPTIONAL "/home/hugo/.conan/data/boost_optional/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/optional/lib")
set(CONAN_RES_DIRS_BOOST_OPTIONAL )
set(CONAN_SRC_DIRS_BOOST_OPTIONAL )
set(CONAN_BUILD_DIRS_BOOST_OPTIONAL "/home/hugo/.conan/data/boost_optional/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_OPTIONAL )
set(CONAN_LIBS_BOOST_OPTIONAL )
set(CONAN_PKG_LIBS_BOOST_OPTIONAL )
set(CONAN_SYSTEM_LIBS_BOOST_OPTIONAL )
set(CONAN_FRAMEWORKS_BOOST_OPTIONAL )
set(CONAN_FRAMEWORKS_FOUND_BOOST_OPTIONAL "")  # Will be filled later
set(CONAN_DEFINES_BOOST_OPTIONAL "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_OPTIONAL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_OPTIONAL "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_OPTIONAL "")
set(CONAN_CXX_FLAGS_BOOST_OPTIONAL "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_OPTIONAL "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_OPTIONAL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_OPTIONAL_LIST "")
set(CONAN_CXX_FLAGS_BOOST_OPTIONAL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_OPTIONAL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_OPTIONAL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_OPTIONAL "${CONAN_FRAMEWORKS_BOOST_OPTIONAL}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_OPTIONAL ${CONAN_PKG_LIBS_BOOST_OPTIONAL} ${CONAN_SYSTEM_LIBS_BOOST_OPTIONAL} ${CONAN_FRAMEWORKS_FOUND_BOOST_OPTIONAL})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_OPTIONAL ${CONAN_PKG_LIBS_BOOST_OPTIONAL} ${CONAN_FRAMEWORKS_FOUND_BOOST_OPTIONAL})


set(CONAN_BOOST_INTRUSIVE_ROOT "/home/hugo/.conan/data/boost_intrusive/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_INTRUSIVE "/home/hugo/.conan/data/boost_intrusive/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/intrusive/include")
set(CONAN_LIB_DIRS_BOOST_INTRUSIVE "/home/hugo/.conan/data/boost_intrusive/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/intrusive/lib")
set(CONAN_BIN_DIRS_BOOST_INTRUSIVE "/home/hugo/.conan/data/boost_intrusive/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/intrusive/lib")
set(CONAN_RES_DIRS_BOOST_INTRUSIVE )
set(CONAN_SRC_DIRS_BOOST_INTRUSIVE )
set(CONAN_BUILD_DIRS_BOOST_INTRUSIVE "/home/hugo/.conan/data/boost_intrusive/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_INTRUSIVE )
set(CONAN_LIBS_BOOST_INTRUSIVE )
set(CONAN_PKG_LIBS_BOOST_INTRUSIVE )
set(CONAN_SYSTEM_LIBS_BOOST_INTRUSIVE )
set(CONAN_FRAMEWORKS_BOOST_INTRUSIVE )
set(CONAN_FRAMEWORKS_FOUND_BOOST_INTRUSIVE "")  # Will be filled later
set(CONAN_DEFINES_BOOST_INTRUSIVE "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_INTRUSIVE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_INTRUSIVE "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_INTRUSIVE "")
set(CONAN_CXX_FLAGS_BOOST_INTRUSIVE "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_INTRUSIVE "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_INTRUSIVE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_INTRUSIVE_LIST "")
set(CONAN_CXX_FLAGS_BOOST_INTRUSIVE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_INTRUSIVE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_INTRUSIVE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_INTRUSIVE "${CONAN_FRAMEWORKS_BOOST_INTRUSIVE}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_INTRUSIVE ${CONAN_PKG_LIBS_BOOST_INTRUSIVE} ${CONAN_SYSTEM_LIBS_BOOST_INTRUSIVE} ${CONAN_FRAMEWORKS_FOUND_BOOST_INTRUSIVE})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_INTRUSIVE ${CONAN_PKG_LIBS_BOOST_INTRUSIVE} ${CONAN_FRAMEWORKS_FOUND_BOOST_INTRUSIVE})


set(CONAN_BOOST_TYPEOF_ROOT "/home/hugo/.conan/data/boost_typeof/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_TYPEOF "/home/hugo/.conan/data/boost_typeof/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/typeof/include")
set(CONAN_LIB_DIRS_BOOST_TYPEOF "/home/hugo/.conan/data/boost_typeof/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/typeof/lib")
set(CONAN_BIN_DIRS_BOOST_TYPEOF "/home/hugo/.conan/data/boost_typeof/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/typeof/lib")
set(CONAN_RES_DIRS_BOOST_TYPEOF )
set(CONAN_SRC_DIRS_BOOST_TYPEOF )
set(CONAN_BUILD_DIRS_BOOST_TYPEOF "/home/hugo/.conan/data/boost_typeof/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_TYPEOF )
set(CONAN_LIBS_BOOST_TYPEOF )
set(CONAN_PKG_LIBS_BOOST_TYPEOF )
set(CONAN_SYSTEM_LIBS_BOOST_TYPEOF )
set(CONAN_FRAMEWORKS_BOOST_TYPEOF )
set(CONAN_FRAMEWORKS_FOUND_BOOST_TYPEOF "")  # Will be filled later
set(CONAN_DEFINES_BOOST_TYPEOF "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_TYPEOF )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_TYPEOF "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_TYPEOF "")
set(CONAN_CXX_FLAGS_BOOST_TYPEOF "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TYPEOF "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TYPEOF "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_TYPEOF_LIST "")
set(CONAN_CXX_FLAGS_BOOST_TYPEOF_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TYPEOF_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TYPEOF_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_TYPEOF "${CONAN_FRAMEWORKS_BOOST_TYPEOF}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_TYPEOF ${CONAN_PKG_LIBS_BOOST_TYPEOF} ${CONAN_SYSTEM_LIBS_BOOST_TYPEOF} ${CONAN_FRAMEWORKS_FOUND_BOOST_TYPEOF})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_TYPEOF ${CONAN_PKG_LIBS_BOOST_TYPEOF} ${CONAN_FRAMEWORKS_FOUND_BOOST_TYPEOF})


set(CONAN_BOOST_SMART_PTR_ROOT "/home/hugo/.conan/data/boost_smart_ptr/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_SMART_PTR "/home/hugo/.conan/data/boost_smart_ptr/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/smart_ptr/include")
set(CONAN_LIB_DIRS_BOOST_SMART_PTR "/home/hugo/.conan/data/boost_smart_ptr/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/smart_ptr/lib")
set(CONAN_BIN_DIRS_BOOST_SMART_PTR "/home/hugo/.conan/data/boost_smart_ptr/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/smart_ptr/lib")
set(CONAN_RES_DIRS_BOOST_SMART_PTR )
set(CONAN_SRC_DIRS_BOOST_SMART_PTR )
set(CONAN_BUILD_DIRS_BOOST_SMART_PTR "/home/hugo/.conan/data/boost_smart_ptr/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_SMART_PTR )
set(CONAN_LIBS_BOOST_SMART_PTR )
set(CONAN_PKG_LIBS_BOOST_SMART_PTR )
set(CONAN_SYSTEM_LIBS_BOOST_SMART_PTR )
set(CONAN_FRAMEWORKS_BOOST_SMART_PTR )
set(CONAN_FRAMEWORKS_FOUND_BOOST_SMART_PTR "")  # Will be filled later
set(CONAN_DEFINES_BOOST_SMART_PTR "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_SMART_PTR )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_SMART_PTR "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_SMART_PTR "")
set(CONAN_CXX_FLAGS_BOOST_SMART_PTR "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_SMART_PTR "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_SMART_PTR "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_SMART_PTR_LIST "")
set(CONAN_CXX_FLAGS_BOOST_SMART_PTR_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_SMART_PTR_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_SMART_PTR_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_SMART_PTR "${CONAN_FRAMEWORKS_BOOST_SMART_PTR}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_SMART_PTR ${CONAN_PKG_LIBS_BOOST_SMART_PTR} ${CONAN_SYSTEM_LIBS_BOOST_SMART_PTR} ${CONAN_FRAMEWORKS_FOUND_BOOST_SMART_PTR})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_SMART_PTR ${CONAN_PKG_LIBS_BOOST_SMART_PTR} ${CONAN_FRAMEWORKS_FOUND_BOOST_SMART_PTR})


set(CONAN_BOOST_TUPLE_ROOT "/home/hugo/.conan/data/boost_tuple/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_TUPLE "/home/hugo/.conan/data/boost_tuple/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tuple/include")
set(CONAN_LIB_DIRS_BOOST_TUPLE "/home/hugo/.conan/data/boost_tuple/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tuple/lib")
set(CONAN_BIN_DIRS_BOOST_TUPLE "/home/hugo/.conan/data/boost_tuple/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tuple/lib")
set(CONAN_RES_DIRS_BOOST_TUPLE )
set(CONAN_SRC_DIRS_BOOST_TUPLE )
set(CONAN_BUILD_DIRS_BOOST_TUPLE "/home/hugo/.conan/data/boost_tuple/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_TUPLE )
set(CONAN_LIBS_BOOST_TUPLE )
set(CONAN_PKG_LIBS_BOOST_TUPLE )
set(CONAN_SYSTEM_LIBS_BOOST_TUPLE )
set(CONAN_FRAMEWORKS_BOOST_TUPLE )
set(CONAN_FRAMEWORKS_FOUND_BOOST_TUPLE "")  # Will be filled later
set(CONAN_DEFINES_BOOST_TUPLE "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_TUPLE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_TUPLE "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_TUPLE "")
set(CONAN_CXX_FLAGS_BOOST_TUPLE "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TUPLE "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TUPLE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_TUPLE_LIST "")
set(CONAN_CXX_FLAGS_BOOST_TUPLE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TUPLE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TUPLE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_TUPLE "${CONAN_FRAMEWORKS_BOOST_TUPLE}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_TUPLE ${CONAN_PKG_LIBS_BOOST_TUPLE} ${CONAN_SYSTEM_LIBS_BOOST_TUPLE} ${CONAN_FRAMEWORKS_FOUND_BOOST_TUPLE})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_TUPLE ${CONAN_PKG_LIBS_BOOST_TUPLE} ${CONAN_FRAMEWORKS_FOUND_BOOST_TUPLE})


set(CONAN_BOOST_FUNCTION_TYPES_ROOT "/home/hugo/.conan/data/boost_function_types/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_FUNCTION_TYPES "/home/hugo/.conan/data/boost_function_types/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function_types/include")
set(CONAN_LIB_DIRS_BOOST_FUNCTION_TYPES "/home/hugo/.conan/data/boost_function_types/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function_types/lib")
set(CONAN_BIN_DIRS_BOOST_FUNCTION_TYPES "/home/hugo/.conan/data/boost_function_types/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function_types/lib")
set(CONAN_RES_DIRS_BOOST_FUNCTION_TYPES )
set(CONAN_SRC_DIRS_BOOST_FUNCTION_TYPES )
set(CONAN_BUILD_DIRS_BOOST_FUNCTION_TYPES "/home/hugo/.conan/data/boost_function_types/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_FUNCTION_TYPES )
set(CONAN_LIBS_BOOST_FUNCTION_TYPES )
set(CONAN_PKG_LIBS_BOOST_FUNCTION_TYPES )
set(CONAN_SYSTEM_LIBS_BOOST_FUNCTION_TYPES )
set(CONAN_FRAMEWORKS_BOOST_FUNCTION_TYPES )
set(CONAN_FRAMEWORKS_FOUND_BOOST_FUNCTION_TYPES "")  # Will be filled later
set(CONAN_DEFINES_BOOST_FUNCTION_TYPES "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_FUNCTION_TYPES )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_TYPES "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_FUNCTION_TYPES "")
set(CONAN_CXX_FLAGS_BOOST_FUNCTION_TYPES "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_TYPES "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_TYPES "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_FUNCTION_TYPES_LIST "")
set(CONAN_CXX_FLAGS_BOOST_FUNCTION_TYPES_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_TYPES_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_TYPES_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_FUNCTION_TYPES "${CONAN_FRAMEWORKS_BOOST_FUNCTION_TYPES}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_FUNCTION_TYPES ${CONAN_PKG_LIBS_BOOST_FUNCTION_TYPES} ${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_TYPES} ${CONAN_FRAMEWORKS_FOUND_BOOST_FUNCTION_TYPES})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_TYPES ${CONAN_PKG_LIBS_BOOST_FUNCTION_TYPES} ${CONAN_FRAMEWORKS_FOUND_BOOST_FUNCTION_TYPES})


set(CONAN_BOOST_MOVE_ROOT "/home/hugo/.conan/data/boost_move/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_MOVE "/home/hugo/.conan/data/boost_move/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/move/include")
set(CONAN_LIB_DIRS_BOOST_MOVE "/home/hugo/.conan/data/boost_move/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/move/lib")
set(CONAN_BIN_DIRS_BOOST_MOVE "/home/hugo/.conan/data/boost_move/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/move/lib")
set(CONAN_RES_DIRS_BOOST_MOVE )
set(CONAN_SRC_DIRS_BOOST_MOVE )
set(CONAN_BUILD_DIRS_BOOST_MOVE "/home/hugo/.conan/data/boost_move/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_MOVE )
set(CONAN_LIBS_BOOST_MOVE )
set(CONAN_PKG_LIBS_BOOST_MOVE )
set(CONAN_SYSTEM_LIBS_BOOST_MOVE )
set(CONAN_FRAMEWORKS_BOOST_MOVE )
set(CONAN_FRAMEWORKS_FOUND_BOOST_MOVE "")  # Will be filled later
set(CONAN_DEFINES_BOOST_MOVE "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_MOVE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_MOVE "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_MOVE "")
set(CONAN_CXX_FLAGS_BOOST_MOVE "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_MOVE "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_MOVE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_MOVE_LIST "")
set(CONAN_CXX_FLAGS_BOOST_MOVE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_MOVE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_MOVE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_MOVE "${CONAN_FRAMEWORKS_BOOST_MOVE}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_MOVE ${CONAN_PKG_LIBS_BOOST_MOVE} ${CONAN_SYSTEM_LIBS_BOOST_MOVE} ${CONAN_FRAMEWORKS_FOUND_BOOST_MOVE})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_MOVE ${CONAN_PKG_LIBS_BOOST_MOVE} ${CONAN_FRAMEWORKS_FOUND_BOOST_MOVE})


set(CONAN_BOOST_MPL_ROOT "/home/hugo/.conan/data/boost_mpl/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_MPL "/home/hugo/.conan/data/boost_mpl/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/mpl/include")
set(CONAN_LIB_DIRS_BOOST_MPL "/home/hugo/.conan/data/boost_mpl/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/mpl/lib")
set(CONAN_BIN_DIRS_BOOST_MPL "/home/hugo/.conan/data/boost_mpl/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/mpl/lib")
set(CONAN_RES_DIRS_BOOST_MPL )
set(CONAN_SRC_DIRS_BOOST_MPL )
set(CONAN_BUILD_DIRS_BOOST_MPL "/home/hugo/.conan/data/boost_mpl/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_MPL )
set(CONAN_LIBS_BOOST_MPL )
set(CONAN_PKG_LIBS_BOOST_MPL )
set(CONAN_SYSTEM_LIBS_BOOST_MPL )
set(CONAN_FRAMEWORKS_BOOST_MPL )
set(CONAN_FRAMEWORKS_FOUND_BOOST_MPL "")  # Will be filled later
set(CONAN_DEFINES_BOOST_MPL "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_MPL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_MPL "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_MPL "")
set(CONAN_CXX_FLAGS_BOOST_MPL "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_MPL "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_MPL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_MPL_LIST "")
set(CONAN_CXX_FLAGS_BOOST_MPL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_MPL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_MPL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_MPL "${CONAN_FRAMEWORKS_BOOST_MPL}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_MPL ${CONAN_PKG_LIBS_BOOST_MPL} ${CONAN_SYSTEM_LIBS_BOOST_MPL} ${CONAN_FRAMEWORKS_FOUND_BOOST_MPL})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_MPL ${CONAN_PKG_LIBS_BOOST_MPL} ${CONAN_FRAMEWORKS_FOUND_BOOST_MPL})


set(CONAN_BOOST_PREDEF_ROOT "/home/hugo/.conan/data/boost_predef/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_PREDEF "/home/hugo/.conan/data/boost_predef/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/predef/include")
set(CONAN_LIB_DIRS_BOOST_PREDEF "/home/hugo/.conan/data/boost_predef/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/predef/lib")
set(CONAN_BIN_DIRS_BOOST_PREDEF "/home/hugo/.conan/data/boost_predef/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/predef/lib")
set(CONAN_RES_DIRS_BOOST_PREDEF )
set(CONAN_SRC_DIRS_BOOST_PREDEF )
set(CONAN_BUILD_DIRS_BOOST_PREDEF "/home/hugo/.conan/data/boost_predef/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_PREDEF )
set(CONAN_LIBS_BOOST_PREDEF )
set(CONAN_PKG_LIBS_BOOST_PREDEF )
set(CONAN_SYSTEM_LIBS_BOOST_PREDEF )
set(CONAN_FRAMEWORKS_BOOST_PREDEF )
set(CONAN_FRAMEWORKS_FOUND_BOOST_PREDEF "")  # Will be filled later
set(CONAN_DEFINES_BOOST_PREDEF "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_PREDEF )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_PREDEF "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_PREDEF "")
set(CONAN_CXX_FLAGS_BOOST_PREDEF "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_PREDEF "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_PREDEF "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_PREDEF_LIST "")
set(CONAN_CXX_FLAGS_BOOST_PREDEF_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_PREDEF_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_PREDEF_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_PREDEF "${CONAN_FRAMEWORKS_BOOST_PREDEF}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_PREDEF ${CONAN_PKG_LIBS_BOOST_PREDEF} ${CONAN_SYSTEM_LIBS_BOOST_PREDEF} ${CONAN_FRAMEWORKS_FOUND_BOOST_PREDEF})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_PREDEF ${CONAN_PKG_LIBS_BOOST_PREDEF} ${CONAN_FRAMEWORKS_FOUND_BOOST_PREDEF})


set(CONAN_BOOST_UTILITY_ROOT "/home/hugo/.conan/data/boost_utility/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_UTILITY "/home/hugo/.conan/data/boost_utility/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/utility/include")
set(CONAN_LIB_DIRS_BOOST_UTILITY "/home/hugo/.conan/data/boost_utility/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/utility/lib")
set(CONAN_BIN_DIRS_BOOST_UTILITY "/home/hugo/.conan/data/boost_utility/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/utility/lib")
set(CONAN_RES_DIRS_BOOST_UTILITY )
set(CONAN_SRC_DIRS_BOOST_UTILITY )
set(CONAN_BUILD_DIRS_BOOST_UTILITY "/home/hugo/.conan/data/boost_utility/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_UTILITY )
set(CONAN_LIBS_BOOST_UTILITY )
set(CONAN_PKG_LIBS_BOOST_UTILITY )
set(CONAN_SYSTEM_LIBS_BOOST_UTILITY )
set(CONAN_FRAMEWORKS_BOOST_UTILITY )
set(CONAN_FRAMEWORKS_FOUND_BOOST_UTILITY "")  # Will be filled later
set(CONAN_DEFINES_BOOST_UTILITY "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_UTILITY )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_UTILITY "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_UTILITY "")
set(CONAN_CXX_FLAGS_BOOST_UTILITY "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_UTILITY "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_UTILITY "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_UTILITY_LIST "")
set(CONAN_CXX_FLAGS_BOOST_UTILITY_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_UTILITY_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_UTILITY_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_UTILITY "${CONAN_FRAMEWORKS_BOOST_UTILITY}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_UTILITY ${CONAN_PKG_LIBS_BOOST_UTILITY} ${CONAN_SYSTEM_LIBS_BOOST_UTILITY} ${CONAN_FRAMEWORKS_FOUND_BOOST_UTILITY})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_UTILITY ${CONAN_PKG_LIBS_BOOST_UTILITY} ${CONAN_FRAMEWORKS_FOUND_BOOST_UTILITY})


set(CONAN_BOOST_THROW_EXCEPTION_ROOT "/home/hugo/.conan/data/boost_throw_exception/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_THROW_EXCEPTION "/home/hugo/.conan/data/boost_throw_exception/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/throw_exception/include")
set(CONAN_LIB_DIRS_BOOST_THROW_EXCEPTION "/home/hugo/.conan/data/boost_throw_exception/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/throw_exception/lib")
set(CONAN_BIN_DIRS_BOOST_THROW_EXCEPTION "/home/hugo/.conan/data/boost_throw_exception/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/throw_exception/lib")
set(CONAN_RES_DIRS_BOOST_THROW_EXCEPTION )
set(CONAN_SRC_DIRS_BOOST_THROW_EXCEPTION )
set(CONAN_BUILD_DIRS_BOOST_THROW_EXCEPTION "/home/hugo/.conan/data/boost_throw_exception/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_THROW_EXCEPTION )
set(CONAN_LIBS_BOOST_THROW_EXCEPTION )
set(CONAN_PKG_LIBS_BOOST_THROW_EXCEPTION )
set(CONAN_SYSTEM_LIBS_BOOST_THROW_EXCEPTION )
set(CONAN_FRAMEWORKS_BOOST_THROW_EXCEPTION )
set(CONAN_FRAMEWORKS_FOUND_BOOST_THROW_EXCEPTION "")  # Will be filled later
set(CONAN_DEFINES_BOOST_THROW_EXCEPTION "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_THROW_EXCEPTION )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_THROW_EXCEPTION "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_THROW_EXCEPTION "")
set(CONAN_CXX_FLAGS_BOOST_THROW_EXCEPTION "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_THROW_EXCEPTION "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_THROW_EXCEPTION "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_THROW_EXCEPTION_LIST "")
set(CONAN_CXX_FLAGS_BOOST_THROW_EXCEPTION_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_THROW_EXCEPTION_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_THROW_EXCEPTION_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_THROW_EXCEPTION "${CONAN_FRAMEWORKS_BOOST_THROW_EXCEPTION}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_THROW_EXCEPTION ${CONAN_PKG_LIBS_BOOST_THROW_EXCEPTION} ${CONAN_SYSTEM_LIBS_BOOST_THROW_EXCEPTION} ${CONAN_FRAMEWORKS_FOUND_BOOST_THROW_EXCEPTION})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_THROW_EXCEPTION ${CONAN_PKG_LIBS_BOOST_THROW_EXCEPTION} ${CONAN_FRAMEWORKS_FOUND_BOOST_THROW_EXCEPTION})


set(CONAN_BOOST_CONTAINER_HASH_ROOT "/home/hugo/.conan/data/boost_container_hash/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_CONTAINER_HASH "/home/hugo/.conan/data/boost_container_hash/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/container_hash/include")
set(CONAN_LIB_DIRS_BOOST_CONTAINER_HASH "/home/hugo/.conan/data/boost_container_hash/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/container_hash/lib")
set(CONAN_BIN_DIRS_BOOST_CONTAINER_HASH "/home/hugo/.conan/data/boost_container_hash/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/container_hash/lib")
set(CONAN_RES_DIRS_BOOST_CONTAINER_HASH )
set(CONAN_SRC_DIRS_BOOST_CONTAINER_HASH )
set(CONAN_BUILD_DIRS_BOOST_CONTAINER_HASH "/home/hugo/.conan/data/boost_container_hash/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CONTAINER_HASH )
set(CONAN_LIBS_BOOST_CONTAINER_HASH )
set(CONAN_PKG_LIBS_BOOST_CONTAINER_HASH )
set(CONAN_SYSTEM_LIBS_BOOST_CONTAINER_HASH )
set(CONAN_FRAMEWORKS_BOOST_CONTAINER_HASH )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CONTAINER_HASH "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CONTAINER_HASH "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CONTAINER_HASH )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_HASH "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CONTAINER_HASH "")
set(CONAN_CXX_FLAGS_BOOST_CONTAINER_HASH "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_HASH "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_HASH "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CONTAINER_HASH_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CONTAINER_HASH_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_HASH_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_HASH_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CONTAINER_HASH "${CONAN_FRAMEWORKS_BOOST_CONTAINER_HASH}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CONTAINER_HASH ${CONAN_PKG_LIBS_BOOST_CONTAINER_HASH} ${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_HASH} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONTAINER_HASH})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_HASH ${CONAN_PKG_LIBS_BOOST_CONTAINER_HASH} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONTAINER_HASH})


set(CONAN_BOOST_INTEGER_ROOT "/home/hugo/.conan/data/boost_integer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_INTEGER "/home/hugo/.conan/data/boost_integer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/integer/include")
set(CONAN_LIB_DIRS_BOOST_INTEGER "/home/hugo/.conan/data/boost_integer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/integer/lib")
set(CONAN_BIN_DIRS_BOOST_INTEGER "/home/hugo/.conan/data/boost_integer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/integer/lib")
set(CONAN_RES_DIRS_BOOST_INTEGER )
set(CONAN_SRC_DIRS_BOOST_INTEGER )
set(CONAN_BUILD_DIRS_BOOST_INTEGER "/home/hugo/.conan/data/boost_integer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_INTEGER )
set(CONAN_LIBS_BOOST_INTEGER )
set(CONAN_PKG_LIBS_BOOST_INTEGER )
set(CONAN_SYSTEM_LIBS_BOOST_INTEGER )
set(CONAN_FRAMEWORKS_BOOST_INTEGER )
set(CONAN_FRAMEWORKS_FOUND_BOOST_INTEGER "")  # Will be filled later
set(CONAN_DEFINES_BOOST_INTEGER "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_INTEGER )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_INTEGER "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_INTEGER "")
set(CONAN_CXX_FLAGS_BOOST_INTEGER "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_INTEGER "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_INTEGER "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_INTEGER_LIST "")
set(CONAN_CXX_FLAGS_BOOST_INTEGER_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_INTEGER_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_INTEGER_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_INTEGER "${CONAN_FRAMEWORKS_BOOST_INTEGER}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_INTEGER ${CONAN_PKG_LIBS_BOOST_INTEGER} ${CONAN_SYSTEM_LIBS_BOOST_INTEGER} ${CONAN_FRAMEWORKS_FOUND_BOOST_INTEGER})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_INTEGER ${CONAN_PKG_LIBS_BOOST_INTEGER} ${CONAN_FRAMEWORKS_FOUND_BOOST_INTEGER})


set(CONAN_BOOST_DETAIL_ROOT "/home/hugo/.conan/data/boost_detail/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_DETAIL "/home/hugo/.conan/data/boost_detail/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/detail/include")
set(CONAN_LIB_DIRS_BOOST_DETAIL "/home/hugo/.conan/data/boost_detail/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/detail/lib")
set(CONAN_BIN_DIRS_BOOST_DETAIL "/home/hugo/.conan/data/boost_detail/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/detail/lib")
set(CONAN_RES_DIRS_BOOST_DETAIL )
set(CONAN_SRC_DIRS_BOOST_DETAIL )
set(CONAN_BUILD_DIRS_BOOST_DETAIL "/home/hugo/.conan/data/boost_detail/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_DETAIL )
set(CONAN_LIBS_BOOST_DETAIL )
set(CONAN_PKG_LIBS_BOOST_DETAIL )
set(CONAN_SYSTEM_LIBS_BOOST_DETAIL )
set(CONAN_FRAMEWORKS_BOOST_DETAIL )
set(CONAN_FRAMEWORKS_FOUND_BOOST_DETAIL "")  # Will be filled later
set(CONAN_DEFINES_BOOST_DETAIL "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_DETAIL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_DETAIL "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_DETAIL "")
set(CONAN_CXX_FLAGS_BOOST_DETAIL "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_DETAIL "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_DETAIL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_DETAIL_LIST "")
set(CONAN_CXX_FLAGS_BOOST_DETAIL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_DETAIL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_DETAIL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_DETAIL "${CONAN_FRAMEWORKS_BOOST_DETAIL}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_DETAIL ${CONAN_PKG_LIBS_BOOST_DETAIL} ${CONAN_SYSTEM_LIBS_BOOST_DETAIL} ${CONAN_FRAMEWORKS_FOUND_BOOST_DETAIL})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_DETAIL ${CONAN_PKG_LIBS_BOOST_DETAIL} ${CONAN_FRAMEWORKS_FOUND_BOOST_DETAIL})


set(CONAN_BOOST_CORE_ROOT "/home/hugo/.conan/data/boost_core/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_CORE "/home/hugo/.conan/data/boost_core/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/core/include")
set(CONAN_LIB_DIRS_BOOST_CORE "/home/hugo/.conan/data/boost_core/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/core/lib")
set(CONAN_BIN_DIRS_BOOST_CORE "/home/hugo/.conan/data/boost_core/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/core/lib")
set(CONAN_RES_DIRS_BOOST_CORE )
set(CONAN_SRC_DIRS_BOOST_CORE )
set(CONAN_BUILD_DIRS_BOOST_CORE "/home/hugo/.conan/data/boost_core/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CORE )
set(CONAN_LIBS_BOOST_CORE )
set(CONAN_PKG_LIBS_BOOST_CORE )
set(CONAN_SYSTEM_LIBS_BOOST_CORE )
set(CONAN_FRAMEWORKS_BOOST_CORE )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CORE "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CORE "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CORE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CORE "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CORE "")
set(CONAN_CXX_FLAGS_BOOST_CORE "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CORE "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CORE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CORE_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CORE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CORE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CORE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CORE "${CONAN_FRAMEWORKS_BOOST_CORE}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CORE ${CONAN_PKG_LIBS_BOOST_CORE} ${CONAN_SYSTEM_LIBS_BOOST_CORE} ${CONAN_FRAMEWORKS_FOUND_BOOST_CORE})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CORE ${CONAN_PKG_LIBS_BOOST_CORE} ${CONAN_FRAMEWORKS_FOUND_BOOST_CORE})


set(CONAN_BOOST_PREPROCESSOR_ROOT "/home/hugo/.conan/data/boost_preprocessor/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_PREPROCESSOR "/home/hugo/.conan/data/boost_preprocessor/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/preprocessor/include")
set(CONAN_LIB_DIRS_BOOST_PREPROCESSOR "/home/hugo/.conan/data/boost_preprocessor/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/preprocessor/lib")
set(CONAN_BIN_DIRS_BOOST_PREPROCESSOR "/home/hugo/.conan/data/boost_preprocessor/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/preprocessor/lib")
set(CONAN_RES_DIRS_BOOST_PREPROCESSOR )
set(CONAN_SRC_DIRS_BOOST_PREPROCESSOR )
set(CONAN_BUILD_DIRS_BOOST_PREPROCESSOR "/home/hugo/.conan/data/boost_preprocessor/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_PREPROCESSOR )
set(CONAN_LIBS_BOOST_PREPROCESSOR )
set(CONAN_PKG_LIBS_BOOST_PREPROCESSOR )
set(CONAN_SYSTEM_LIBS_BOOST_PREPROCESSOR )
set(CONAN_FRAMEWORKS_BOOST_PREPROCESSOR )
set(CONAN_FRAMEWORKS_FOUND_BOOST_PREPROCESSOR "")  # Will be filled later
set(CONAN_DEFINES_BOOST_PREPROCESSOR "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_PREPROCESSOR )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_PREPROCESSOR "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_PREPROCESSOR "")
set(CONAN_CXX_FLAGS_BOOST_PREPROCESSOR "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_PREPROCESSOR "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_PREPROCESSOR "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_PREPROCESSOR_LIST "")
set(CONAN_CXX_FLAGS_BOOST_PREPROCESSOR_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_PREPROCESSOR_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_PREPROCESSOR_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_PREPROCESSOR "${CONAN_FRAMEWORKS_BOOST_PREPROCESSOR}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_PREPROCESSOR ${CONAN_PKG_LIBS_BOOST_PREPROCESSOR} ${CONAN_SYSTEM_LIBS_BOOST_PREPROCESSOR} ${CONAN_FRAMEWORKS_FOUND_BOOST_PREPROCESSOR})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_PREPROCESSOR ${CONAN_PKG_LIBS_BOOST_PREPROCESSOR} ${CONAN_FRAMEWORKS_FOUND_BOOST_PREPROCESSOR})


set(CONAN_BOOST_TYPE_TRAITS_ROOT "/home/hugo/.conan/data/boost_type_traits/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_TYPE_TRAITS "/home/hugo/.conan/data/boost_type_traits/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_traits/include")
set(CONAN_LIB_DIRS_BOOST_TYPE_TRAITS "/home/hugo/.conan/data/boost_type_traits/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_traits/lib")
set(CONAN_BIN_DIRS_BOOST_TYPE_TRAITS "/home/hugo/.conan/data/boost_type_traits/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_traits/lib")
set(CONAN_RES_DIRS_BOOST_TYPE_TRAITS )
set(CONAN_SRC_DIRS_BOOST_TYPE_TRAITS )
set(CONAN_BUILD_DIRS_BOOST_TYPE_TRAITS "/home/hugo/.conan/data/boost_type_traits/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_TYPE_TRAITS )
set(CONAN_LIBS_BOOST_TYPE_TRAITS )
set(CONAN_PKG_LIBS_BOOST_TYPE_TRAITS )
set(CONAN_SYSTEM_LIBS_BOOST_TYPE_TRAITS )
set(CONAN_FRAMEWORKS_BOOST_TYPE_TRAITS )
set(CONAN_FRAMEWORKS_FOUND_BOOST_TYPE_TRAITS "")  # Will be filled later
set(CONAN_DEFINES_BOOST_TYPE_TRAITS "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_TYPE_TRAITS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_TRAITS "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_TYPE_TRAITS "")
set(CONAN_CXX_FLAGS_BOOST_TYPE_TRAITS "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_TRAITS "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_TRAITS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_TYPE_TRAITS_LIST "")
set(CONAN_CXX_FLAGS_BOOST_TYPE_TRAITS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_TRAITS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_TRAITS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_TYPE_TRAITS "${CONAN_FRAMEWORKS_BOOST_TYPE_TRAITS}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_TYPE_TRAITS ${CONAN_PKG_LIBS_BOOST_TYPE_TRAITS} ${CONAN_SYSTEM_LIBS_BOOST_TYPE_TRAITS} ${CONAN_FRAMEWORKS_FOUND_BOOST_TYPE_TRAITS})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_TRAITS ${CONAN_PKG_LIBS_BOOST_TYPE_TRAITS} ${CONAN_FRAMEWORKS_FOUND_BOOST_TYPE_TRAITS})


set(CONAN_BOOST_ASSERT_ROOT "/home/hugo/.conan/data/boost_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_ASSERT "/home/hugo/.conan/data/boost_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/assert/include")
set(CONAN_LIB_DIRS_BOOST_ASSERT "/home/hugo/.conan/data/boost_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/assert/lib")
set(CONAN_BIN_DIRS_BOOST_ASSERT "/home/hugo/.conan/data/boost_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/assert/lib")
set(CONAN_RES_DIRS_BOOST_ASSERT )
set(CONAN_SRC_DIRS_BOOST_ASSERT )
set(CONAN_BUILD_DIRS_BOOST_ASSERT "/home/hugo/.conan/data/boost_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_ASSERT )
set(CONAN_LIBS_BOOST_ASSERT )
set(CONAN_PKG_LIBS_BOOST_ASSERT )
set(CONAN_SYSTEM_LIBS_BOOST_ASSERT )
set(CONAN_FRAMEWORKS_BOOST_ASSERT )
set(CONAN_FRAMEWORKS_FOUND_BOOST_ASSERT "")  # Will be filled later
set(CONAN_DEFINES_BOOST_ASSERT "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_ASSERT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_ASSERT "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_ASSERT "")
set(CONAN_CXX_FLAGS_BOOST_ASSERT "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ASSERT "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ASSERT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_ASSERT_LIST "")
set(CONAN_CXX_FLAGS_BOOST_ASSERT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_ASSERT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_ASSERT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_ASSERT "${CONAN_FRAMEWORKS_BOOST_ASSERT}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_ASSERT ${CONAN_PKG_LIBS_BOOST_ASSERT} ${CONAN_SYSTEM_LIBS_BOOST_ASSERT} ${CONAN_FRAMEWORKS_FOUND_BOOST_ASSERT})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_ASSERT ${CONAN_PKG_LIBS_BOOST_ASSERT} ${CONAN_FRAMEWORKS_FOUND_BOOST_ASSERT})


set(CONAN_BOOST_STATIC_ASSERT_ROOT "/home/hugo/.conan/data/boost_static_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_STATIC_ASSERT "/home/hugo/.conan/data/boost_static_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/static_assert/include")
set(CONAN_LIB_DIRS_BOOST_STATIC_ASSERT "/home/hugo/.conan/data/boost_static_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/static_assert/lib")
set(CONAN_BIN_DIRS_BOOST_STATIC_ASSERT "/home/hugo/.conan/data/boost_static_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/static_assert/lib")
set(CONAN_RES_DIRS_BOOST_STATIC_ASSERT )
set(CONAN_SRC_DIRS_BOOST_STATIC_ASSERT )
set(CONAN_BUILD_DIRS_BOOST_STATIC_ASSERT "/home/hugo/.conan/data/boost_static_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_STATIC_ASSERT )
set(CONAN_LIBS_BOOST_STATIC_ASSERT )
set(CONAN_PKG_LIBS_BOOST_STATIC_ASSERT )
set(CONAN_SYSTEM_LIBS_BOOST_STATIC_ASSERT )
set(CONAN_FRAMEWORKS_BOOST_STATIC_ASSERT )
set(CONAN_FRAMEWORKS_FOUND_BOOST_STATIC_ASSERT "")  # Will be filled later
set(CONAN_DEFINES_BOOST_STATIC_ASSERT "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_STATIC_ASSERT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_STATIC_ASSERT "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_STATIC_ASSERT "")
set(CONAN_CXX_FLAGS_BOOST_STATIC_ASSERT "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_STATIC_ASSERT "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_STATIC_ASSERT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_STATIC_ASSERT_LIST "")
set(CONAN_CXX_FLAGS_BOOST_STATIC_ASSERT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_STATIC_ASSERT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_STATIC_ASSERT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_STATIC_ASSERT "${CONAN_FRAMEWORKS_BOOST_STATIC_ASSERT}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_STATIC_ASSERT ${CONAN_PKG_LIBS_BOOST_STATIC_ASSERT} ${CONAN_SYSTEM_LIBS_BOOST_STATIC_ASSERT} ${CONAN_FRAMEWORKS_FOUND_BOOST_STATIC_ASSERT})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_STATIC_ASSERT ${CONAN_PKG_LIBS_BOOST_STATIC_ASSERT} ${CONAN_FRAMEWORKS_FOUND_BOOST_STATIC_ASSERT})


set(CONAN_BOOST_CONFIG_ROOT "/home/hugo/.conan/data/boost_config/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_BOOST_CONFIG "/home/hugo/.conan/data/boost_config/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/config/include")
set(CONAN_LIB_DIRS_BOOST_CONFIG "/home/hugo/.conan/data/boost_config/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/config/lib")
set(CONAN_BIN_DIRS_BOOST_CONFIG "/home/hugo/.conan/data/boost_config/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/config/lib")
set(CONAN_RES_DIRS_BOOST_CONFIG )
set(CONAN_SRC_DIRS_BOOST_CONFIG )
set(CONAN_BUILD_DIRS_BOOST_CONFIG "/home/hugo/.conan/data/boost_config/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_BOOST_CONFIG )
set(CONAN_LIBS_BOOST_CONFIG )
set(CONAN_PKG_LIBS_BOOST_CONFIG )
set(CONAN_SYSTEM_LIBS_BOOST_CONFIG )
set(CONAN_FRAMEWORKS_BOOST_CONFIG )
set(CONAN_FRAMEWORKS_FOUND_BOOST_CONFIG "")  # Will be filled later
set(CONAN_DEFINES_BOOST_CONFIG "-DBOOST_ALL_NO_LIB=1")
set(CONAN_BUILD_MODULES_PATHS_BOOST_CONFIG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST_CONFIG "BOOST_ALL_NO_LIB=1")

set(CONAN_C_FLAGS_BOOST_CONFIG "")
set(CONAN_CXX_FLAGS_BOOST_CONFIG "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONFIG "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONFIG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_CONFIG_LIST "")
set(CONAN_CXX_FLAGS_BOOST_CONFIG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_CONFIG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_CONFIG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST_CONFIG "${CONAN_FRAMEWORKS_BOOST_CONFIG}")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST_CONFIG ${CONAN_PKG_LIBS_BOOST_CONFIG} ${CONAN_SYSTEM_LIBS_BOOST_CONFIG} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONFIG})
# Aggregate package libs and frameworks for conan_package_library_targets()
set(CONAN_LIBS_FRAMEWORKS_BOOST_CONFIG ${CONAN_PKG_LIBS_BOOST_CONFIG} ${CONAN_FRAMEWORKS_FOUND_BOOST_CONFIG})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_ARCH_BUILD "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "gcc")
set(CONAN_SETTINGS_COMPILER_LIBCXX "libstdc++11")
set(CONAN_SETTINGS_COMPILER_VERSION "7")
set(CONAN_SETTINGS_CPPSTD "17")
set(CONAN_SETTINGS_OS "Linux")
set(CONAN_SETTINGS_OS_BUILD "Linux")

set(CONAN_DEPENDENCIES sfml boost boost_asio freetype stb openal flac vorbis boost_coroutine boost_date_time libpng libalsa ogg boost_context boost_thread boost_cycle_group_c zlib bzip2 boost_chrono boost_pool boost_algorithm boost_endian boost_filesystem boost_foreach boost_lexical_cast boost_locale boost_math boost_phoenix boost_tokenizer boost_tti boost_variant lzma zstd boost_ratio boost_system boost_io boost_cycle_group_b boost_proto boost_rational boost_winapi boost_atomic boost_range boost_lambda boost_cycle_group_a boost_array boost_exception boost_function boost_numeric_conversion boost_regex boost_unordered boost_bind boost_type_index boost_iterator boost_container boost_concept_check boost_conversion boost_fusion boost_optional boost_intrusive boost_typeof boost_smart_ptr boost_tuple boost_function_types boost_move boost_mpl boost_predef boost_utility boost_throw_exception boost_container_hash boost_integer boost_detail boost_core boost_preprocessor boost_type_traits boost_assert boost_static_assert boost_config)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "/home/hugo/.conan/data/sfml/2.5.1/bincrafters/stable/package/8b7784d5fc174258519ade3ba45409d3f6e66c75/include"
			"/home/hugo/.conan/data/boost/1.71.0/conan/stable/package/63aa18f4c96abf22f1e546119f1f7bbee8e30165/include"
			"/home/hugo/.conan/data/boost_asio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/asio/include"
			"/home/hugo/.conan/data/freetype/2.9.0/bincrafters/stable/package/3cdd93cd46fc07735d1b0d7f2860a82fac7a3053/include"
			"/home/hugo/.conan/data/freetype/2.9.0/bincrafters/stable/package/3cdd93cd46fc07735d1b0d7f2860a82fac7a3053/include/freetype2"
			"/home/hugo/.conan/data/stb/20180214/conan/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/home/hugo/.conan/data/openal/1.19.0/bincrafters/stable/package/812e1deb664b70de9456fc54c225f826fbca36e7/include"
			"/home/hugo/.conan/data/openal/1.19.0/bincrafters/stable/package/812e1deb664b70de9456fc54c225f826fbca36e7/include/AL"
			"/home/hugo/.conan/data/flac/1.3.2/bincrafters/stable/package/ef227c7ca8be49f078e2c7c4a6cebbac879b693a/include"
			"/home/hugo/.conan/data/vorbis/1.3.6/bincrafters/stable/package/8d8cebdeda6ff46ba515968aa8b099a24769ca16/include"
			"/home/hugo/.conan/data/boost_coroutine/1.69.0/bincrafters/stable/package/3a126ad3c96cb43850c72e8d16858ee488064b51/coroutine/include"
			"/home/hugo/.conan/data/libpng/1.6.34/bincrafters/stable/package/b781af3f476d0aa5070a0a35b544db7a3c193cc8/include"
			"/home/hugo/.conan/data/libalsa/1.1.5/conan/stable/package/bff9a7d5ab267a535181ec5b36392417340ff035/include"
			"/home/hugo/.conan/data/ogg/1.3.3/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/include"
			"/home/hugo/.conan/data/boost_context/1.69.0/bincrafters/stable/package/fdc3c109b752a0f02a0df154e7fd9582761316d2/context/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/date_time/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/dynamic_bitset/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/iostreams/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/multiprecision/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/random/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/serialization/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/spirit/include"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/thread/include"
			"/home/hugo/.conan/data/zlib/1.2.11/conan/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/include"
			"/home/hugo/.conan/data/bzip2/1.0.6/conan/stable/package/b27e2b40bcb70be2e7d6f0e0c6e43e35c530f8d3/include"
			"/home/hugo/.conan/data/boost_chrono/1.69.0/bincrafters/stable/package/ce35b0314e3ac4d3bef6c25d378f0ae50b74faee/chrono/include"
			"/home/hugo/.conan/data/boost_pool/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/pool/include"
			"/home/hugo/.conan/data/boost_endian/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/endian/include"
			"/home/hugo/.conan/data/boost_filesystem/1.69.0/bincrafters/stable/package/eae29f422477d86464fecbf40168da4935248cce/filesystem/include"
			"/home/hugo/.conan/data/boost_foreach/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/foreach/include"
			"/home/hugo/.conan/data/boost_locale/1.69.0/bincrafters/stable/package/e71e34ac7b5ccfea2103ad478158f6be7d1aabb6/locale/include"
			"/home/hugo/.conan/data/boost_phoenix/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/phoenix/include"
			"/home/hugo/.conan/data/boost_tokenizer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tokenizer/include"
			"/home/hugo/.conan/data/boost_tti/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tti/include"
			"/home/hugo/.conan/data/boost_variant/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/variant/include"
			"/home/hugo/.conan/data/lzma/5.2.4/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/include"
			"/home/hugo/.conan/data/zstd/1.3.5/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/include"
			"/home/hugo/.conan/data/boost_ratio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/ratio/include"
			"/home/hugo/.conan/data/boost_system/1.69.0/bincrafters/stable/package/663b6ae87778ab67e3abf1b0e1db7bbd5c0a1794/system/include"
			"/home/hugo/.conan/data/boost_io/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/io/include"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/lexical_cast/include"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/math/include"
			"/home/hugo/.conan/data/boost_proto/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/proto/include"
			"/home/hugo/.conan/data/boost_rational/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/rational/include"
			"/home/hugo/.conan/data/boost_winapi/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/winapi/include"
			"/home/hugo/.conan/data/boost_atomic/1.69.0/bincrafters/stable/package/80d4553e807857a762eb0f64781d0625c1b0ad72/atomic/include"
			"/home/hugo/.conan/data/boost_lambda/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lambda/include"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/algorithm/include"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/range/include"
			"/home/hugo/.conan/data/boost_array/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/array/include"
			"/home/hugo/.conan/data/boost_exception/1.69.0/bincrafters/stable/package/a2b0f38cd477002de46eaedcab7fafd540d3be0a/exception/include"
			"/home/hugo/.conan/data/boost_function/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function/include"
			"/home/hugo/.conan/data/boost_numeric_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/numeric_conversion/include"
			"/home/hugo/.conan/data/boost_regex/1.69.0/bincrafters/stable/package/02dfd2e024018d0d9493b40e3cb73694b7182084/regex/include"
			"/home/hugo/.conan/data/boost_unordered/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/unordered/include"
			"/home/hugo/.conan/data/boost_bind/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/bind/include"
			"/home/hugo/.conan/data/boost_type_index/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_index/include"
			"/home/hugo/.conan/data/boost_iterator/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/iterator/include"
			"/home/hugo/.conan/data/boost_container/1.69.0/bincrafters/stable/package/14cb647d789b7ccacc6b582166c87fbb1aeb68ca/container/include"
			"/home/hugo/.conan/data/boost_concept_check/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/concept_check/include"
			"/home/hugo/.conan/data/boost_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/conversion/include"
			"/home/hugo/.conan/data/boost_fusion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/fusion/include"
			"/home/hugo/.conan/data/boost_optional/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/optional/include"
			"/home/hugo/.conan/data/boost_intrusive/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/intrusive/include"
			"/home/hugo/.conan/data/boost_typeof/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/typeof/include"
			"/home/hugo/.conan/data/boost_smart_ptr/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/smart_ptr/include"
			"/home/hugo/.conan/data/boost_tuple/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tuple/include"
			"/home/hugo/.conan/data/boost_function_types/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function_types/include"
			"/home/hugo/.conan/data/boost_move/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/move/include"
			"/home/hugo/.conan/data/boost_mpl/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/mpl/include"
			"/home/hugo/.conan/data/boost_predef/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/predef/include"
			"/home/hugo/.conan/data/boost_utility/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/utility/include"
			"/home/hugo/.conan/data/boost_throw_exception/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/throw_exception/include"
			"/home/hugo/.conan/data/boost_container_hash/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/container_hash/include"
			"/home/hugo/.conan/data/boost_integer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/integer/include"
			"/home/hugo/.conan/data/boost_detail/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/detail/include"
			"/home/hugo/.conan/data/boost_core/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/core/include"
			"/home/hugo/.conan/data/boost_preprocessor/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/preprocessor/include"
			"/home/hugo/.conan/data/boost_type_traits/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_traits/include"
			"/home/hugo/.conan/data/boost_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/assert/include"
			"/home/hugo/.conan/data/boost_static_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/static_assert/include"
			"/home/hugo/.conan/data/boost_config/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/config/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "/home/hugo/.conan/data/sfml/2.5.1/bincrafters/stable/package/8b7784d5fc174258519ade3ba45409d3f6e66c75/lib"
			"/home/hugo/.conan/data/boost/1.71.0/conan/stable/package/63aa18f4c96abf22f1e546119f1f7bbee8e30165/lib"
			"/home/hugo/.conan/data/boost_asio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/asio/lib"
			"/home/hugo/.conan/data/freetype/2.9.0/bincrafters/stable/package/3cdd93cd46fc07735d1b0d7f2860a82fac7a3053/lib"
			"/home/hugo/.conan/data/openal/1.19.0/bincrafters/stable/package/812e1deb664b70de9456fc54c225f826fbca36e7/lib"
			"/home/hugo/.conan/data/flac/1.3.2/bincrafters/stable/package/ef227c7ca8be49f078e2c7c4a6cebbac879b693a/lib"
			"/home/hugo/.conan/data/vorbis/1.3.6/bincrafters/stable/package/8d8cebdeda6ff46ba515968aa8b099a24769ca16/lib"
			"/home/hugo/.conan/data/boost_coroutine/1.69.0/bincrafters/stable/package/3a126ad3c96cb43850c72e8d16858ee488064b51/coroutine/lib"
			"/home/hugo/.conan/data/libpng/1.6.34/bincrafters/stable/package/b781af3f476d0aa5070a0a35b544db7a3c193cc8/lib"
			"/home/hugo/.conan/data/libalsa/1.1.5/conan/stable/package/bff9a7d5ab267a535181ec5b36392417340ff035/lib"
			"/home/hugo/.conan/data/ogg/1.3.3/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib"
			"/home/hugo/.conan/data/boost_context/1.69.0/bincrafters/stable/package/fdc3c109b752a0f02a0df154e7fd9582761316d2/context/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/date_time/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/dynamic_bitset/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/iostreams/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/multiprecision/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/random/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/serialization/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/spirit/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/thread/lib"
			"/home/hugo/.conan/data/zlib/1.2.11/conan/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib"
			"/home/hugo/.conan/data/bzip2/1.0.6/conan/stable/package/b27e2b40bcb70be2e7d6f0e0c6e43e35c530f8d3/lib"
			"/home/hugo/.conan/data/boost_chrono/1.69.0/bincrafters/stable/package/ce35b0314e3ac4d3bef6c25d378f0ae50b74faee/chrono/lib"
			"/home/hugo/.conan/data/boost_pool/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/pool/lib"
			"/home/hugo/.conan/data/boost_endian/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/endian/lib"
			"/home/hugo/.conan/data/boost_filesystem/1.69.0/bincrafters/stable/package/eae29f422477d86464fecbf40168da4935248cce/filesystem/lib"
			"/home/hugo/.conan/data/boost_foreach/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/foreach/lib"
			"/home/hugo/.conan/data/boost_locale/1.69.0/bincrafters/stable/package/e71e34ac7b5ccfea2103ad478158f6be7d1aabb6/locale/lib"
			"/home/hugo/.conan/data/boost_phoenix/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/phoenix/lib"
			"/home/hugo/.conan/data/boost_tokenizer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tokenizer/lib"
			"/home/hugo/.conan/data/boost_tti/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tti/lib"
			"/home/hugo/.conan/data/boost_variant/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/variant/lib"
			"/home/hugo/.conan/data/lzma/5.2.4/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib"
			"/home/hugo/.conan/data/zstd/1.3.5/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib"
			"/home/hugo/.conan/data/boost_ratio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/ratio/lib"
			"/home/hugo/.conan/data/boost_system/1.69.0/bincrafters/stable/package/663b6ae87778ab67e3abf1b0e1db7bbd5c0a1794/system/lib"
			"/home/hugo/.conan/data/boost_io/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/io/lib"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/lexical_cast/lib"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/math/lib"
			"/home/hugo/.conan/data/boost_proto/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/proto/lib"
			"/home/hugo/.conan/data/boost_rational/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/rational/lib"
			"/home/hugo/.conan/data/boost_winapi/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/winapi/lib"
			"/home/hugo/.conan/data/boost_atomic/1.69.0/bincrafters/stable/package/80d4553e807857a762eb0f64781d0625c1b0ad72/atomic/lib"
			"/home/hugo/.conan/data/boost_lambda/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lambda/lib"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/algorithm/lib"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/range/lib"
			"/home/hugo/.conan/data/boost_array/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/array/lib"
			"/home/hugo/.conan/data/boost_exception/1.69.0/bincrafters/stable/package/a2b0f38cd477002de46eaedcab7fafd540d3be0a/exception/lib"
			"/home/hugo/.conan/data/boost_function/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function/lib"
			"/home/hugo/.conan/data/boost_numeric_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/numeric_conversion/lib"
			"/home/hugo/.conan/data/boost_regex/1.69.0/bincrafters/stable/package/02dfd2e024018d0d9493b40e3cb73694b7182084/regex/lib"
			"/home/hugo/.conan/data/boost_unordered/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/unordered/lib"
			"/home/hugo/.conan/data/boost_bind/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/bind/lib"
			"/home/hugo/.conan/data/boost_type_index/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_index/lib"
			"/home/hugo/.conan/data/boost_iterator/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/iterator/lib"
			"/home/hugo/.conan/data/boost_container/1.69.0/bincrafters/stable/package/14cb647d789b7ccacc6b582166c87fbb1aeb68ca/container/lib"
			"/home/hugo/.conan/data/boost_concept_check/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/concept_check/lib"
			"/home/hugo/.conan/data/boost_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/conversion/lib"
			"/home/hugo/.conan/data/boost_fusion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/fusion/lib"
			"/home/hugo/.conan/data/boost_optional/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/optional/lib"
			"/home/hugo/.conan/data/boost_intrusive/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/intrusive/lib"
			"/home/hugo/.conan/data/boost_typeof/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/typeof/lib"
			"/home/hugo/.conan/data/boost_smart_ptr/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/smart_ptr/lib"
			"/home/hugo/.conan/data/boost_tuple/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tuple/lib"
			"/home/hugo/.conan/data/boost_function_types/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function_types/lib"
			"/home/hugo/.conan/data/boost_move/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/move/lib"
			"/home/hugo/.conan/data/boost_mpl/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/mpl/lib"
			"/home/hugo/.conan/data/boost_predef/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/predef/lib"
			"/home/hugo/.conan/data/boost_utility/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/utility/lib"
			"/home/hugo/.conan/data/boost_throw_exception/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/throw_exception/lib"
			"/home/hugo/.conan/data/boost_container_hash/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/container_hash/lib"
			"/home/hugo/.conan/data/boost_integer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/integer/lib"
			"/home/hugo/.conan/data/boost_detail/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/detail/lib"
			"/home/hugo/.conan/data/boost_core/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/core/lib"
			"/home/hugo/.conan/data/boost_preprocessor/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/preprocessor/lib"
			"/home/hugo/.conan/data/boost_type_traits/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_traits/lib"
			"/home/hugo/.conan/data/boost_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/assert/lib"
			"/home/hugo/.conan/data/boost_static_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/static_assert/lib"
			"/home/hugo/.conan/data/boost_config/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/config/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "/home/hugo/.conan/data/boost_asio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/asio/lib"
			"/home/hugo/.conan/data/boost_coroutine/1.69.0/bincrafters/stable/package/3a126ad3c96cb43850c72e8d16858ee488064b51/coroutine/lib"
			"/home/hugo/.conan/data/libpng/1.6.34/bincrafters/stable/package/b781af3f476d0aa5070a0a35b544db7a3c193cc8/bin"
			"/home/hugo/.conan/data/libalsa/1.1.5/conan/stable/package/bff9a7d5ab267a535181ec5b36392417340ff035/bin"
			"/home/hugo/.conan/data/boost_context/1.69.0/bincrafters/stable/package/fdc3c109b752a0f02a0df154e7fd9582761316d2/context/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/date_time/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/dynamic_bitset/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/iostreams/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/multiprecision/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/random/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/serialization/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/spirit/lib"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/thread/lib"
			"/home/hugo/.conan/data/bzip2/1.0.6/conan/stable/package/b27e2b40bcb70be2e7d6f0e0c6e43e35c530f8d3/bin"
			"/home/hugo/.conan/data/boost_chrono/1.69.0/bincrafters/stable/package/ce35b0314e3ac4d3bef6c25d378f0ae50b74faee/chrono/lib"
			"/home/hugo/.conan/data/boost_pool/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/pool/lib"
			"/home/hugo/.conan/data/boost_endian/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/endian/lib"
			"/home/hugo/.conan/data/boost_filesystem/1.69.0/bincrafters/stable/package/eae29f422477d86464fecbf40168da4935248cce/filesystem/lib"
			"/home/hugo/.conan/data/boost_foreach/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/foreach/lib"
			"/home/hugo/.conan/data/boost_locale/1.69.0/bincrafters/stable/package/e71e34ac7b5ccfea2103ad478158f6be7d1aabb6/locale/lib"
			"/home/hugo/.conan/data/boost_phoenix/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/phoenix/lib"
			"/home/hugo/.conan/data/boost_tokenizer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tokenizer/lib"
			"/home/hugo/.conan/data/boost_tti/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tti/lib"
			"/home/hugo/.conan/data/boost_variant/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/variant/lib"
			"/home/hugo/.conan/data/boost_ratio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/ratio/lib"
			"/home/hugo/.conan/data/boost_system/1.69.0/bincrafters/stable/package/663b6ae87778ab67e3abf1b0e1db7bbd5c0a1794/system/lib"
			"/home/hugo/.conan/data/boost_io/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/io/lib"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/lexical_cast/lib"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/math/lib"
			"/home/hugo/.conan/data/boost_proto/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/proto/lib"
			"/home/hugo/.conan/data/boost_rational/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/rational/lib"
			"/home/hugo/.conan/data/boost_winapi/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/winapi/lib"
			"/home/hugo/.conan/data/boost_atomic/1.69.0/bincrafters/stable/package/80d4553e807857a762eb0f64781d0625c1b0ad72/atomic/lib"
			"/home/hugo/.conan/data/boost_lambda/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lambda/lib"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/algorithm/lib"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/range/lib"
			"/home/hugo/.conan/data/boost_array/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/array/lib"
			"/home/hugo/.conan/data/boost_exception/1.69.0/bincrafters/stable/package/a2b0f38cd477002de46eaedcab7fafd540d3be0a/exception/lib"
			"/home/hugo/.conan/data/boost_function/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function/lib"
			"/home/hugo/.conan/data/boost_numeric_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/numeric_conversion/lib"
			"/home/hugo/.conan/data/boost_regex/1.69.0/bincrafters/stable/package/02dfd2e024018d0d9493b40e3cb73694b7182084/regex/lib"
			"/home/hugo/.conan/data/boost_unordered/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/unordered/lib"
			"/home/hugo/.conan/data/boost_bind/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/bind/lib"
			"/home/hugo/.conan/data/boost_type_index/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_index/lib"
			"/home/hugo/.conan/data/boost_iterator/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/iterator/lib"
			"/home/hugo/.conan/data/boost_container/1.69.0/bincrafters/stable/package/14cb647d789b7ccacc6b582166c87fbb1aeb68ca/container/lib"
			"/home/hugo/.conan/data/boost_concept_check/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/concept_check/lib"
			"/home/hugo/.conan/data/boost_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/conversion/lib"
			"/home/hugo/.conan/data/boost_fusion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/fusion/lib"
			"/home/hugo/.conan/data/boost_optional/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/optional/lib"
			"/home/hugo/.conan/data/boost_intrusive/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/intrusive/lib"
			"/home/hugo/.conan/data/boost_typeof/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/typeof/lib"
			"/home/hugo/.conan/data/boost_smart_ptr/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/smart_ptr/lib"
			"/home/hugo/.conan/data/boost_tuple/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/tuple/lib"
			"/home/hugo/.conan/data/boost_function_types/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/function_types/lib"
			"/home/hugo/.conan/data/boost_move/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/move/lib"
			"/home/hugo/.conan/data/boost_mpl/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/mpl/lib"
			"/home/hugo/.conan/data/boost_predef/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/predef/lib"
			"/home/hugo/.conan/data/boost_utility/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/utility/lib"
			"/home/hugo/.conan/data/boost_throw_exception/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/throw_exception/lib"
			"/home/hugo/.conan/data/boost_container_hash/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/container_hash/lib"
			"/home/hugo/.conan/data/boost_integer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/integer/lib"
			"/home/hugo/.conan/data/boost_detail/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/detail/lib"
			"/home/hugo/.conan/data/boost_core/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/core/lib"
			"/home/hugo/.conan/data/boost_preprocessor/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/preprocessor/lib"
			"/home/hugo/.conan/data/boost_type_traits/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/type_traits/lib"
			"/home/hugo/.conan/data/boost_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/assert/lib"
			"/home/hugo/.conan/data/boost_static_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/static_assert/lib"
			"/home/hugo/.conan/data/boost_config/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/config/lib" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS  ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS sfml-graphics-s sfml-window-s sfml-network-s sfml-audio-s sfml-system-s Xrandr Xext Xrender X11 xcb Xau Xdmcp GL udev boost_wave boost_contract boost_graph boost_iostreams boost_log boost_program_options boost_random boost_serialization boost_wserialization boost_fiber boost_timer boost_type_erasure boost_log_setup boost_stacktrace_addr2line boost_stacktrace_backtrace boost_stacktrace_basic boost_stacktrace_noop boost_unit_test_framework freetype openal flac flac++ vorbisfile vorbisenc vorbis boost_coroutine boost_date_time png16 asound dl m ogg boost_context boost_thread rt z bz2 boost_chrono boost_filesystem boost_locale boost_math_tr1 boost_math_tr1l boost_math_c99l boost_math_tr1f boost_math_c99f boost_math_c99 lzma zstd pthread boost_system boost_atomic boost_exception boost_regex boost_container ${CONAN_LIBS})
set(CONAN_PKG_LIBS sfml-graphics-s sfml-window-s sfml-network-s sfml-audio-s sfml-system-s Xrandr Xext Xrender X11 xcb Xau Xdmcp GL udev boost_wave boost_contract boost_graph boost_iostreams boost_log boost_program_options boost_random boost_serialization boost_wserialization boost_fiber boost_timer boost_type_erasure boost_log_setup boost_stacktrace_addr2line boost_stacktrace_backtrace boost_stacktrace_basic boost_stacktrace_noop boost_unit_test_framework freetype openal flac flac++ vorbisfile vorbisenc vorbis boost_coroutine boost_date_time png16 asound dl m ogg boost_context boost_thread rt z bz2 boost_chrono boost_filesystem boost_locale boost_math_tr1 boost_math_tr1l boost_math_c99l boost_math_tr1f boost_math_c99f boost_math_c99 lzma zstd pthread boost_system boost_atomic boost_exception boost_regex boost_container ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS )
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DLZMA_API_STATIC"
			"-DBOOST_IOSTREAMS_USE_BZIP2=1"
			"-DBOOST_IOSTREAMS_USE_ZLIB=1"
			"-DBOOST_IOSTREAMS_USE_LZMA=1"
			"-DBOOST_IOSTREAMS_USE_ZSTD=1"
			"-DFLAC__NO_DLL"
			"-DAL_LIBTYPE_STATIC"
			"-DSTB_TEXTEDIT_KEYTYPE=unsigned"
			"-DBOOST_ALL_NO_LIB=1"
			"-D_GLIBCXX_USE_CXX11_ABI=1"
			"-DSFML_STATIC" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS  ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "/home/hugo/.conan/data/sfml/2.5.1/bincrafters/stable/package/8b7784d5fc174258519ade3ba45409d3f6e66c75/"
			"/home/hugo/.conan/data/boost/1.71.0/conan/stable/package/63aa18f4c96abf22f1e546119f1f7bbee8e30165/"
			"/home/hugo/.conan/data/boost_asio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/freetype/2.9.0/bincrafters/stable/package/3cdd93cd46fc07735d1b0d7f2860a82fac7a3053/"
			"/home/hugo/.conan/data/stb/20180214/conan/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/openal/1.19.0/bincrafters/stable/package/812e1deb664b70de9456fc54c225f826fbca36e7/"
			"/home/hugo/.conan/data/flac/1.3.2/bincrafters/stable/package/ef227c7ca8be49f078e2c7c4a6cebbac879b693a/"
			"/home/hugo/.conan/data/vorbis/1.3.6/bincrafters/stable/package/8d8cebdeda6ff46ba515968aa8b099a24769ca16/"
			"/home/hugo/.conan/data/boost_coroutine/1.69.0/bincrafters/stable/package/3a126ad3c96cb43850c72e8d16858ee488064b51/"
			"/home/hugo/.conan/data/boost_date_time/1.69.0/bincrafters/stable/package/b91ec170483dcd2bfce52d0eda76e6c781b3a1c7/"
			"/home/hugo/.conan/data/libpng/1.6.34/bincrafters/stable/package/b781af3f476d0aa5070a0a35b544db7a3c193cc8/"
			"/home/hugo/.conan/data/libalsa/1.1.5/conan/stable/package/bff9a7d5ab267a535181ec5b36392417340ff035/"
			"/home/hugo/.conan/data/ogg/1.3.3/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/"
			"/home/hugo/.conan/data/boost_context/1.69.0/bincrafters/stable/package/fdc3c109b752a0f02a0df154e7fd9582761316d2/"
			"/home/hugo/.conan/data/boost_thread/1.69.0/bincrafters/stable/package/cb054d0b3e1ca595dc66bc2339d40f1f8f04ab31/"
			"/home/hugo/.conan/data/boost_cycle_group_c/1.69.0/bincrafters/stable/package/442696888164f2773dc55435aba4739641ba9940/"
			"/home/hugo/.conan/data/zlib/1.2.11/conan/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/"
			"/home/hugo/.conan/data/bzip2/1.0.6/conan/stable/package/b27e2b40bcb70be2e7d6f0e0c6e43e35c530f8d3/"
			"/home/hugo/.conan/data/boost_chrono/1.69.0/bincrafters/stable/package/ce35b0314e3ac4d3bef6c25d378f0ae50b74faee/"
			"/home/hugo/.conan/data/boost_pool/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_algorithm/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_endian/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_filesystem/1.69.0/bincrafters/stable/package/eae29f422477d86464fecbf40168da4935248cce/"
			"/home/hugo/.conan/data/boost_foreach/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_lexical_cast/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_locale/1.69.0/bincrafters/stable/package/e71e34ac7b5ccfea2103ad478158f6be7d1aabb6/"
			"/home/hugo/.conan/data/boost_math/1.69.0/bincrafters/stable/package/0ceee36be9ea061ef9d0599085570de73b3ccf97/"
			"/home/hugo/.conan/data/boost_phoenix/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_tokenizer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_tti/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_variant/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/lzma/5.2.4/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/lib/pkgconfig"
			"/home/hugo/.conan/data/zstd/1.3.5/bincrafters/stable/package/d50a0d523d98c15bb147b18fa7d203887c38be8b/"
			"/home/hugo/.conan/data/boost_ratio/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_system/1.69.0/bincrafters/stable/package/663b6ae87778ab67e3abf1b0e1db7bbd5c0a1794/"
			"/home/hugo/.conan/data/boost_io/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_cycle_group_b/1.69.0/bincrafters/stable/package/7e744d95367a14dd340f0ad8d43c5e33b4a844aa/"
			"/home/hugo/.conan/data/boost_proto/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_rational/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_winapi/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_atomic/1.69.0/bincrafters/stable/package/80d4553e807857a762eb0f64781d0625c1b0ad72/"
			"/home/hugo/.conan/data/boost_range/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_lambda/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_cycle_group_a/1.69.0/bincrafters/stable/package/c78db0d0ae21a5cfa9c6ecc4cc08cec1221ba444/"
			"/home/hugo/.conan/data/boost_array/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_exception/1.69.0/bincrafters/stable/package/a2b0f38cd477002de46eaedcab7fafd540d3be0a/"
			"/home/hugo/.conan/data/boost_function/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_numeric_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_regex/1.69.0/bincrafters/stable/package/02dfd2e024018d0d9493b40e3cb73694b7182084/"
			"/home/hugo/.conan/data/boost_unordered/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_bind/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_type_index/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_iterator/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_container/1.69.0/bincrafters/stable/package/14cb647d789b7ccacc6b582166c87fbb1aeb68ca/"
			"/home/hugo/.conan/data/boost_concept_check/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_conversion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_fusion/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_optional/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_intrusive/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_typeof/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_smart_ptr/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_tuple/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_function_types/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_move/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_mpl/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_predef/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_utility/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_throw_exception/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_container_hash/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_integer/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_detail/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_core/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_preprocessor/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_type_traits/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_static_assert/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/hugo/.conan/data/boost_config/1.69.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}")
# Append to aggregated values variable
set(CONAN_LIBS ${CONAN_PKG_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_SFML}" "${CONAN_LIB_DIRS_SFML}"
                                  CONAN_PACKAGE_TARGETS_SFML "${CONAN_SYSTEM_LIBS_SFML} CONAN_PKG::freetype CONAN_PKG::stb CONAN_PKG::openal CONAN_PKG::flac CONAN_PKG::ogg CONAN_PKG::vorbis"
                                  "" sfml)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_SFML_DEBUG}" "${CONAN_LIB_DIRS_SFML_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_SFML_DEBUG "${CONAN_SYSTEM_LIBS_SFML_DEBUG} CONAN_PKG::freetype CONAN_PKG::stb CONAN_PKG::openal CONAN_PKG::flac CONAN_PKG::ogg CONAN_PKG::vorbis"
                                  "debug" sfml)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_SFML_RELEASE}" "${CONAN_LIB_DIRS_SFML_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_SFML_RELEASE "${CONAN_SYSTEM_LIBS_SFML_RELEASE} CONAN_PKG::freetype CONAN_PKG::stb CONAN_PKG::openal CONAN_PKG::flac CONAN_PKG::ogg CONAN_PKG::vorbis"
                                  "release" sfml)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_SFML_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_SFML_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_SFML_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_SFML_RELWITHDEBINFO} CONAN_PKG::freetype CONAN_PKG::stb CONAN_PKG::openal CONAN_PKG::flac CONAN_PKG::ogg CONAN_PKG::vorbis"
                                  "relwithdebinfo" sfml)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_SFML_MINSIZEREL}" "${CONAN_LIB_DIRS_SFML_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_SFML_MINSIZEREL "${CONAN_SYSTEM_LIBS_SFML_MINSIZEREL} CONAN_PKG::freetype CONAN_PKG::stb CONAN_PKG::openal CONAN_PKG::flac CONAN_PKG::ogg CONAN_PKG::vorbis"
                                  "minsizerel" sfml)

    add_library(CONAN_PKG::sfml INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::sfml PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_SFML} ${CONAN_SHARED_LINKER_FLAGS_SFML_LIST} ${CONAN_EXE_LINKER_FLAGS_SFML_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_SFML_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_SFML_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_SFML_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_SFML_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_SFML_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_SFML_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_SFML_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_SFML_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_SFML_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_SFML_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_SFML_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_SFML_DEBUG_LIST}>
                                                                 CONAN_PKG::freetype CONAN_PKG::stb CONAN_PKG::openal CONAN_PKG::flac CONAN_PKG::ogg CONAN_PKG::vorbis)
    set_property(TARGET CONAN_PKG::sfml PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_SFML}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_SFML_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_SFML_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_SFML_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_SFML_DEBUG}>)
    set_property(TARGET CONAN_PKG::sfml PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_SFML}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_SFML_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_SFML_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_SFML_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_SFML_DEBUG}>)
    set_property(TARGET CONAN_PKG::sfml PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_SFML_LIST} ${CONAN_CXX_FLAGS_SFML_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_SFML_RELEASE_LIST} ${CONAN_CXX_FLAGS_SFML_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_SFML_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_SFML_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_SFML_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_SFML_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_SFML_DEBUG_LIST}  ${CONAN_CXX_FLAGS_SFML_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST}" "${CONAN_LIB_DIRS_BOOST}"
                                  CONAN_PACKAGE_TARGETS_BOOST "${CONAN_SYSTEM_LIBS_BOOST} CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "" boost)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DEBUG}" "${CONAN_LIB_DIRS_BOOST_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_DEBUG} CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "debug" boost)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RELEASE}" "${CONAN_LIB_DIRS_BOOST_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_RELEASE} CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "release" boost)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "relwithdebinfo" boost)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "minsizerel" boost)

    add_library(CONAN_PKG::boost INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DEBUG_LIST}>
                                                                 CONAN_PKG::zlib CONAN_PKG::bzip2)
    set_property(TARGET CONAN_PKG::boost PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_LIST} ${CONAN_CXX_FLAGS_BOOST_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASIO}" "${CONAN_LIB_DIRS_BOOST_ASIO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASIO "${CONAN_SYSTEM_LIBS_BOOST_ASIO} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_coroutine CONAN_PKG::boost_date_time CONAN_PKG::boost_function CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_asio)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASIO_DEBUG}" "${CONAN_LIB_DIRS_BOOST_ASIO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASIO_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_ASIO_DEBUG} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_coroutine CONAN_PKG::boost_date_time CONAN_PKG::boost_function CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_asio)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASIO_RELEASE}" "${CONAN_LIB_DIRS_BOOST_ASIO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASIO_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_ASIO_RELEASE} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_coroutine CONAN_PKG::boost_date_time CONAN_PKG::boost_function CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_asio)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASIO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_ASIO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASIO_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_ASIO_RELWITHDEBINFO} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_coroutine CONAN_PKG::boost_date_time CONAN_PKG::boost_function CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_asio)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASIO_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_ASIO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASIO_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_ASIO_MINSIZEREL} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_coroutine CONAN_PKG::boost_date_time CONAN_PKG::boost_function CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_asio)

    add_library(CONAN_PKG::boost_asio INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_asio PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_ASIO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASIO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASIO_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_ASIO_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASIO_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASIO_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_ASIO_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASIO_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_ASIO_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASIO_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASIO_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_ASIO_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASIO_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASIO_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_coroutine CONAN_PKG::boost_date_time CONAN_PKG::boost_function CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_asio PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_ASIO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_ASIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_ASIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_ASIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_ASIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_asio PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_ASIO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_ASIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_ASIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_ASIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_ASIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_asio PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_ASIO_LIST} ${CONAN_CXX_FLAGS_BOOST_ASIO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_ASIO_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_ASIO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_ASIO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_ASIO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_ASIO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_ASIO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_ASIO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_ASIO_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FREETYPE}" "${CONAN_LIB_DIRS_FREETYPE}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE "${CONAN_SYSTEM_LIBS_FREETYPE} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "" freetype)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FREETYPE_DEBUG}" "${CONAN_LIB_DIRS_FREETYPE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_DEBUG "${CONAN_SYSTEM_LIBS_FREETYPE_DEBUG} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "debug" freetype)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FREETYPE_RELEASE}" "${CONAN_LIB_DIRS_FREETYPE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_RELEASE "${CONAN_SYSTEM_LIBS_FREETYPE_RELEASE} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "release" freetype)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FREETYPE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FREETYPE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FREETYPE_RELWITHDEBINFO} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "relwithdebinfo" freetype)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FREETYPE_MINSIZEREL}" "${CONAN_LIB_DIRS_FREETYPE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_MINSIZEREL "${CONAN_SYSTEM_LIBS_FREETYPE_MINSIZEREL} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2"
                                  "minsizerel" freetype)

    add_library(CONAN_PKG::freetype INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FREETYPE} ${CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST} ${CONAN_EXE_LINKER_FLAGS_FREETYPE_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FREETYPE_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FREETYPE_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FREETYPE_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FREETYPE_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_FREETYPE_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>
                                                                 CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FREETYPE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FREETYPE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FREETYPE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FREETYPE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FREETYPE_DEBUG}>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FREETYPE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_DEBUG}>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FREETYPE_LIST} ${CONAN_CXX_FLAGS_FREETYPE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FREETYPE_RELEASE_LIST} ${CONAN_CXX_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FREETYPE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FREETYPE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FREETYPE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FREETYPE_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_STB}" "${CONAN_LIB_DIRS_STB}"
                                  CONAN_PACKAGE_TARGETS_STB "${CONAN_SYSTEM_LIBS_STB} "
                                  "" stb)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_STB_DEBUG}" "${CONAN_LIB_DIRS_STB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_STB_DEBUG "${CONAN_SYSTEM_LIBS_STB_DEBUG} "
                                  "debug" stb)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_STB_RELEASE}" "${CONAN_LIB_DIRS_STB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_STB_RELEASE "${CONAN_SYSTEM_LIBS_STB_RELEASE} "
                                  "release" stb)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_STB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_STB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_STB_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_STB_RELWITHDEBINFO} "
                                  "relwithdebinfo" stb)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_STB_MINSIZEREL}" "${CONAN_LIB_DIRS_STB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_STB_MINSIZEREL "${CONAN_SYSTEM_LIBS_STB_MINSIZEREL} "
                                  "minsizerel" stb)

    add_library(CONAN_PKG::stb INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_STB} ${CONAN_SHARED_LINKER_FLAGS_STB_LIST} ${CONAN_EXE_LINKER_FLAGS_STB_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_STB_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_STB_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_STB_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_STB_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_STB_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_STB_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_STB_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_STB_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_STB_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_STB_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_STB_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_STB_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_STB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_STB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_STB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_STB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_STB_DEBUG}>)
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_STB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_STB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_STB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_STB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_STB_DEBUG}>)
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_STB_LIST} ${CONAN_CXX_FLAGS_STB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_STB_RELEASE_LIST} ${CONAN_CXX_FLAGS_STB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_STB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_STB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_STB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_STB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_STB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_STB_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OPENAL}" "${CONAN_LIB_DIRS_OPENAL}"
                                  CONAN_PACKAGE_TARGETS_OPENAL "${CONAN_SYSTEM_LIBS_OPENAL} CONAN_PKG::libalsa"
                                  "" openal)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OPENAL_DEBUG}" "${CONAN_LIB_DIRS_OPENAL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENAL_DEBUG "${CONAN_SYSTEM_LIBS_OPENAL_DEBUG} CONAN_PKG::libalsa"
                                  "debug" openal)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OPENAL_RELEASE}" "${CONAN_LIB_DIRS_OPENAL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENAL_RELEASE "${CONAN_SYSTEM_LIBS_OPENAL_RELEASE} CONAN_PKG::libalsa"
                                  "release" openal)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OPENAL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENAL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENAL_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENAL_RELWITHDEBINFO} CONAN_PKG::libalsa"
                                  "relwithdebinfo" openal)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OPENAL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENAL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENAL_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENAL_MINSIZEREL} CONAN_PKG::libalsa"
                                  "minsizerel" openal)

    add_library(CONAN_PKG::openal INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::openal PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENAL} ${CONAN_SHARED_LINKER_FLAGS_OPENAL_LIST} ${CONAN_EXE_LINKER_FLAGS_OPENAL_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENAL_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_OPENAL_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_OPENAL_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENAL_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_OPENAL_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_OPENAL_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENAL_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_OPENAL_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_OPENAL_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENAL_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_OPENAL_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_OPENAL_DEBUG_LIST}>
                                                                 CONAN_PKG::libalsa)
    set_property(TARGET CONAN_PKG::openal PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENAL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENAL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENAL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENAL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENAL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openal PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENAL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENAL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENAL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENAL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENAL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openal PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENAL_LIST} ${CONAN_CXX_FLAGS_OPENAL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENAL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENAL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENAL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENAL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENAL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENAL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENAL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENAL_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FLAC}" "${CONAN_LIB_DIRS_FLAC}"
                                  CONAN_PACKAGE_TARGETS_FLAC "${CONAN_SYSTEM_LIBS_FLAC} CONAN_PKG::ogg"
                                  "" flac)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FLAC_DEBUG}" "${CONAN_LIB_DIRS_FLAC_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FLAC_DEBUG "${CONAN_SYSTEM_LIBS_FLAC_DEBUG} CONAN_PKG::ogg"
                                  "debug" flac)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FLAC_RELEASE}" "${CONAN_LIB_DIRS_FLAC_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FLAC_RELEASE "${CONAN_SYSTEM_LIBS_FLAC_RELEASE} CONAN_PKG::ogg"
                                  "release" flac)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FLAC_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FLAC_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FLAC_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FLAC_RELWITHDEBINFO} CONAN_PKG::ogg"
                                  "relwithdebinfo" flac)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_FLAC_MINSIZEREL}" "${CONAN_LIB_DIRS_FLAC_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FLAC_MINSIZEREL "${CONAN_SYSTEM_LIBS_FLAC_MINSIZEREL} CONAN_PKG::ogg"
                                  "minsizerel" flac)

    add_library(CONAN_PKG::flac INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::flac PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FLAC} ${CONAN_SHARED_LINKER_FLAGS_FLAC_LIST} ${CONAN_EXE_LINKER_FLAGS_FLAC_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FLAC_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_FLAC_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_FLAC_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FLAC_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_FLAC_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_FLAC_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FLAC_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_FLAC_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_FLAC_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FLAC_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_FLAC_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_FLAC_DEBUG_LIST}>
                                                                 CONAN_PKG::ogg)
    set_property(TARGET CONAN_PKG::flac PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FLAC}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FLAC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FLAC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FLAC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FLAC_DEBUG}>)
    set_property(TARGET CONAN_PKG::flac PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FLAC}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FLAC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FLAC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FLAC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FLAC_DEBUG}>)
    set_property(TARGET CONAN_PKG::flac PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FLAC_LIST} ${CONAN_CXX_FLAGS_FLAC_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FLAC_RELEASE_LIST} ${CONAN_CXX_FLAGS_FLAC_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FLAC_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FLAC_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FLAC_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FLAC_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FLAC_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FLAC_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_VORBIS}" "${CONAN_LIB_DIRS_VORBIS}"
                                  CONAN_PACKAGE_TARGETS_VORBIS "${CONAN_SYSTEM_LIBS_VORBIS} CONAN_PKG::ogg"
                                  "" vorbis)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_VORBIS_DEBUG}" "${CONAN_LIB_DIRS_VORBIS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_VORBIS_DEBUG "${CONAN_SYSTEM_LIBS_VORBIS_DEBUG} CONAN_PKG::ogg"
                                  "debug" vorbis)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_VORBIS_RELEASE}" "${CONAN_LIB_DIRS_VORBIS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_VORBIS_RELEASE "${CONAN_SYSTEM_LIBS_VORBIS_RELEASE} CONAN_PKG::ogg"
                                  "release" vorbis)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_VORBIS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_VORBIS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_VORBIS_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_VORBIS_RELWITHDEBINFO} CONAN_PKG::ogg"
                                  "relwithdebinfo" vorbis)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_VORBIS_MINSIZEREL}" "${CONAN_LIB_DIRS_VORBIS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_VORBIS_MINSIZEREL "${CONAN_SYSTEM_LIBS_VORBIS_MINSIZEREL} CONAN_PKG::ogg"
                                  "minsizerel" vorbis)

    add_library(CONAN_PKG::vorbis INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::vorbis PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_VORBIS} ${CONAN_SHARED_LINKER_FLAGS_VORBIS_LIST} ${CONAN_EXE_LINKER_FLAGS_VORBIS_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_VORBIS_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_VORBIS_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_VORBIS_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_VORBIS_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_VORBIS_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_VORBIS_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_VORBIS_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_VORBIS_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_VORBIS_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_VORBIS_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_VORBIS_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_VORBIS_DEBUG_LIST}>
                                                                 CONAN_PKG::ogg)
    set_property(TARGET CONAN_PKG::vorbis PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_VORBIS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_VORBIS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_VORBIS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_VORBIS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_VORBIS_DEBUG}>)
    set_property(TARGET CONAN_PKG::vorbis PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_VORBIS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_VORBIS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_VORBIS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_VORBIS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_VORBIS_DEBUG}>)
    set_property(TARGET CONAN_PKG::vorbis PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_VORBIS_LIST} ${CONAN_CXX_FLAGS_VORBIS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_VORBIS_RELEASE_LIST} ${CONAN_CXX_FLAGS_VORBIS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_VORBIS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_VORBIS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_VORBIS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_VORBIS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_VORBIS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_VORBIS_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_COROUTINE}" "${CONAN_LIB_DIRS_BOOST_COROUTINE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_COROUTINE "${CONAN_SYSTEM_LIBS_BOOST_COROUTINE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_context CONAN_PKG::boost_core CONAN_PKG::boost_exception CONAN_PKG::boost_move CONAN_PKG::boost_range CONAN_PKG::boost_system CONAN_PKG::boost_thread CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_coroutine)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_COROUTINE_DEBUG}" "${CONAN_LIB_DIRS_BOOST_COROUTINE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_COROUTINE_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_COROUTINE_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_context CONAN_PKG::boost_core CONAN_PKG::boost_exception CONAN_PKG::boost_move CONAN_PKG::boost_range CONAN_PKG::boost_system CONAN_PKG::boost_thread CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_coroutine)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_COROUTINE_RELEASE}" "${CONAN_LIB_DIRS_BOOST_COROUTINE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_COROUTINE_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_COROUTINE_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_context CONAN_PKG::boost_core CONAN_PKG::boost_exception CONAN_PKG::boost_move CONAN_PKG::boost_range CONAN_PKG::boost_system CONAN_PKG::boost_thread CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_coroutine)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_COROUTINE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_COROUTINE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_COROUTINE_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_COROUTINE_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_context CONAN_PKG::boost_core CONAN_PKG::boost_exception CONAN_PKG::boost_move CONAN_PKG::boost_range CONAN_PKG::boost_system CONAN_PKG::boost_thread CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_coroutine)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_COROUTINE_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_COROUTINE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_COROUTINE_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_COROUTINE_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_context CONAN_PKG::boost_core CONAN_PKG::boost_exception CONAN_PKG::boost_move CONAN_PKG::boost_range CONAN_PKG::boost_system CONAN_PKG::boost_thread CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_coroutine)

    add_library(CONAN_PKG::boost_coroutine INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_coroutine PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_COROUTINE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_COROUTINE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_COROUTINE_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_COROUTINE_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_COROUTINE_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_COROUTINE_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_COROUTINE_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_COROUTINE_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_COROUTINE_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_COROUTINE_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_COROUTINE_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_COROUTINE_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_COROUTINE_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_COROUTINE_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_COROUTINE_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_context CONAN_PKG::boost_core CONAN_PKG::boost_exception CONAN_PKG::boost_move CONAN_PKG::boost_range CONAN_PKG::boost_system CONAN_PKG::boost_thread CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_coroutine PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_COROUTINE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_COROUTINE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_COROUTINE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_COROUTINE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_COROUTINE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_coroutine PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_COROUTINE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_COROUTINE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_COROUTINE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_COROUTINE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_COROUTINE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_coroutine PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_COROUTINE_LIST} ${CONAN_CXX_FLAGS_BOOST_COROUTINE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_COROUTINE_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_COROUTINE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_COROUTINE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_COROUTINE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_COROUTINE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_COROUTINE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_COROUTINE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_COROUTINE_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DATE_TIME}" "${CONAN_LIB_DIRS_BOOST_DATE_TIME}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME "${CONAN_SYSTEM_LIBS_BOOST_DATE_TIME} CONAN_PKG::boost_cycle_group_c"
                                  "" boost_date_time)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DATE_TIME_DEBUG}" "${CONAN_LIB_DIRS_BOOST_DATE_TIME_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_DATE_TIME_DEBUG} CONAN_PKG::boost_cycle_group_c"
                                  "debug" boost_date_time)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DATE_TIME_RELEASE}" "${CONAN_LIB_DIRS_BOOST_DATE_TIME_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_DATE_TIME_RELEASE} CONAN_PKG::boost_cycle_group_c"
                                  "release" boost_date_time)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DATE_TIME_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_DATE_TIME_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_DATE_TIME_RELWITHDEBINFO} CONAN_PKG::boost_cycle_group_c"
                                  "relwithdebinfo" boost_date_time)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DATE_TIME_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_DATE_TIME_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_DATE_TIME_MINSIZEREL} CONAN_PKG::boost_cycle_group_c"
                                  "minsizerel" boost_date_time)

    add_library(CONAN_PKG::boost_date_time INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_date_time PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DATE_TIME_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DATE_TIME_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DATE_TIME_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DATE_TIME_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DATE_TIME_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DATE_TIME_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DATE_TIME_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DATE_TIME_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_DATE_TIME_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DATE_TIME_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DATE_TIME_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_cycle_group_c)
    set_property(TARGET CONAN_PKG::boost_date_time PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_DATE_TIME}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_DATE_TIME_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_DATE_TIME_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_DATE_TIME_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_DATE_TIME_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_date_time PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_DATE_TIME}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_DATE_TIME_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_DATE_TIME_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_DATE_TIME_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_DATE_TIME_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_date_time PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_DATE_TIME_LIST} ${CONAN_CXX_FLAGS_BOOST_DATE_TIME_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_DATE_TIME_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_DATE_TIME_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_DATE_TIME_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_DATE_TIME_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_DATE_TIME_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_DATE_TIME_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_DATE_TIME_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_DATE_TIME_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBPNG}" "${CONAN_LIB_DIRS_LIBPNG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG "${CONAN_SYSTEM_LIBS_LIBPNG} CONAN_PKG::zlib"
                                  "" libpng)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBPNG_DEBUG}" "${CONAN_LIB_DIRS_LIBPNG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG "${CONAN_SYSTEM_LIBS_LIBPNG_DEBUG} CONAN_PKG::zlib"
                                  "debug" libpng)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBPNG_RELEASE}" "${CONAN_LIB_DIRS_LIBPNG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE "${CONAN_SYSTEM_LIBS_LIBPNG_RELEASE} CONAN_PKG::zlib"
                                  "release" libpng)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBPNG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPNG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPNG_RELWITHDEBINFO} CONAN_PKG::zlib"
                                  "relwithdebinfo" libpng)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBPNG_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPNG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPNG_MINSIZEREL} CONAN_PKG::zlib"
                                  "minsizerel" libpng)

    add_library(CONAN_PKG::libpng INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPNG} ${CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_LIBPNG_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>
                                                                 CONAN_PKG::zlib)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPNG_LIST} ${CONAN_CXX_FLAGS_LIBPNG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPNG_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPNG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPNG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPNG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPNG_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBALSA}" "${CONAN_LIB_DIRS_LIBALSA}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA "${CONAN_SYSTEM_LIBS_LIBALSA} "
                                  "" libalsa)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBALSA_DEBUG}" "${CONAN_LIB_DIRS_LIBALSA_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA_DEBUG "${CONAN_SYSTEM_LIBS_LIBALSA_DEBUG} "
                                  "debug" libalsa)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBALSA_RELEASE}" "${CONAN_LIB_DIRS_LIBALSA_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA_RELEASE "${CONAN_SYSTEM_LIBS_LIBALSA_RELEASE} "
                                  "release" libalsa)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBALSA_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBALSA_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBALSA_RELWITHDEBINFO} "
                                  "relwithdebinfo" libalsa)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LIBALSA_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBALSA_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBALSA_MINSIZEREL} "
                                  "minsizerel" libalsa)

    add_library(CONAN_PKG::libalsa INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libalsa PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBALSA} ${CONAN_SHARED_LINKER_FLAGS_LIBALSA_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBALSA_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBALSA_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_LIBALSA_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBALSA_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBALSA_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_LIBALSA_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBALSA_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBALSA_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_LIBALSA_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBALSA_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBALSA_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_LIBALSA_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_LIBALSA_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::libalsa PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBALSA}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBALSA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBALSA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBALSA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBALSA_DEBUG}>)
    set_property(TARGET CONAN_PKG::libalsa PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBALSA}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBALSA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBALSA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBALSA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBALSA_DEBUG}>)
    set_property(TARGET CONAN_PKG::libalsa PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBALSA_LIST} ${CONAN_CXX_FLAGS_LIBALSA_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBALSA_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBALSA_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBALSA_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBALSA_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBALSA_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBALSA_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBALSA_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBALSA_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OGG}" "${CONAN_LIB_DIRS_OGG}"
                                  CONAN_PACKAGE_TARGETS_OGG "${CONAN_SYSTEM_LIBS_OGG} "
                                  "" ogg)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OGG_DEBUG}" "${CONAN_LIB_DIRS_OGG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OGG_DEBUG "${CONAN_SYSTEM_LIBS_OGG_DEBUG} "
                                  "debug" ogg)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OGG_RELEASE}" "${CONAN_LIB_DIRS_OGG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OGG_RELEASE "${CONAN_SYSTEM_LIBS_OGG_RELEASE} "
                                  "release" ogg)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OGG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OGG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OGG_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OGG_RELWITHDEBINFO} "
                                  "relwithdebinfo" ogg)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_OGG_MINSIZEREL}" "${CONAN_LIB_DIRS_OGG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OGG_MINSIZEREL "${CONAN_SYSTEM_LIBS_OGG_MINSIZEREL} "
                                  "minsizerel" ogg)

    add_library(CONAN_PKG::ogg INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::ogg PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OGG} ${CONAN_SHARED_LINKER_FLAGS_OGG_LIST} ${CONAN_EXE_LINKER_FLAGS_OGG_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OGG_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_OGG_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_OGG_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OGG_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_OGG_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_OGG_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OGG_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_OGG_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_OGG_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OGG_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_OGG_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_OGG_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::ogg PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OGG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OGG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OGG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OGG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OGG_DEBUG}>)
    set_property(TARGET CONAN_PKG::ogg PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OGG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OGG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OGG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OGG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OGG_DEBUG}>)
    set_property(TARGET CONAN_PKG::ogg PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OGG_LIST} ${CONAN_CXX_FLAGS_OGG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OGG_RELEASE_LIST} ${CONAN_CXX_FLAGS_OGG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OGG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OGG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OGG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OGG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OGG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OGG_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTEXT}" "${CONAN_LIB_DIRS_BOOST_CONTEXT}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTEXT "${CONAN_SYSTEM_LIBS_BOOST_CONTEXT} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_thread"
                                  "" boost_context)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTEXT_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CONTEXT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTEXT_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CONTEXT_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_thread"
                                  "debug" boost_context)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTEXT_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CONTEXT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTEXT_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CONTEXT_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_thread"
                                  "release" boost_context)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTEXT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CONTEXT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTEXT_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CONTEXT_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_thread"
                                  "relwithdebinfo" boost_context)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTEXT_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CONTEXT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTEXT_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CONTEXT_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_thread"
                                  "minsizerel" boost_context)

    add_library(CONAN_PKG::boost_context INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_context PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CONTEXT} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTEXT_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTEXT_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CONTEXT_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTEXT_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTEXT_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CONTEXT_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTEXT_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTEXT_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CONTEXT_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTEXT_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTEXT_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CONTEXT_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTEXT_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTEXT_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_thread)
    set_property(TARGET CONAN_PKG::boost_context PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CONTEXT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CONTEXT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CONTEXT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CONTEXT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CONTEXT_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_context PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CONTEXT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTEXT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTEXT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTEXT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTEXT_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_context PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CONTEXT_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTEXT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CONTEXT_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTEXT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CONTEXT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTEXT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CONTEXT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTEXT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CONTEXT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CONTEXT_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THREAD}" "${CONAN_LIB_DIRS_BOOST_THREAD}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THREAD "${CONAN_SYSTEM_LIBS_BOOST_THREAD} CONAN_PKG::boost_cycle_group_c"
                                  "" boost_thread)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THREAD_DEBUG}" "${CONAN_LIB_DIRS_BOOST_THREAD_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THREAD_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_THREAD_DEBUG} CONAN_PKG::boost_cycle_group_c"
                                  "debug" boost_thread)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THREAD_RELEASE}" "${CONAN_LIB_DIRS_BOOST_THREAD_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THREAD_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_THREAD_RELEASE} CONAN_PKG::boost_cycle_group_c"
                                  "release" boost_thread)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THREAD_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_THREAD_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THREAD_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_THREAD_RELWITHDEBINFO} CONAN_PKG::boost_cycle_group_c"
                                  "relwithdebinfo" boost_thread)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THREAD_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_THREAD_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THREAD_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_THREAD_MINSIZEREL} CONAN_PKG::boost_cycle_group_c"
                                  "minsizerel" boost_thread)

    add_library(CONAN_PKG::boost_thread INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_thread PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_THREAD} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THREAD_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THREAD_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_THREAD_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THREAD_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THREAD_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_THREAD_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THREAD_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THREAD_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_THREAD_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THREAD_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THREAD_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_THREAD_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THREAD_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THREAD_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_cycle_group_c)
    set_property(TARGET CONAN_PKG::boost_thread PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_THREAD}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_THREAD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_THREAD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_THREAD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_THREAD_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_thread PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_THREAD}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_THREAD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_THREAD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_THREAD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_THREAD_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_thread PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_THREAD_LIST} ${CONAN_CXX_FLAGS_BOOST_THREAD_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_THREAD_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_THREAD_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_THREAD_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_THREAD_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_THREAD_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_THREAD_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_THREAD_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_THREAD_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_C}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_C}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_C} CONAN_PKG::boost_algorithm CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_endian CONAN_PKG::boost_exception CONAN_PKG::boost_filesystem CONAN_PKG::boost_foreach CONAN_PKG::boost_function CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_intrusive CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_lexical_cast CONAN_PKG::boost_locale CONAN_PKG::boost_math CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_phoenix CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_rational CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tokenizer CONAN_PKG::boost_tti CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_unordered CONAN_PKG::boost_utility CONAN_PKG::boost_variant CONAN_PKG::boost_winapi CONAN_PKG::bzip2 CONAN_PKG::zlib CONAN_PKG::lzma CONAN_PKG::zstd"
                                  "" boost_cycle_group_c)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_C_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_C_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_C_DEBUG} CONAN_PKG::boost_algorithm CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_endian CONAN_PKG::boost_exception CONAN_PKG::boost_filesystem CONAN_PKG::boost_foreach CONAN_PKG::boost_function CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_intrusive CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_lexical_cast CONAN_PKG::boost_locale CONAN_PKG::boost_math CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_phoenix CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_rational CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tokenizer CONAN_PKG::boost_tti CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_unordered CONAN_PKG::boost_utility CONAN_PKG::boost_variant CONAN_PKG::boost_winapi CONAN_PKG::bzip2 CONAN_PKG::zlib CONAN_PKG::lzma CONAN_PKG::zstd"
                                  "debug" boost_cycle_group_c)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_C_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_C_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_C_RELEASE} CONAN_PKG::boost_algorithm CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_endian CONAN_PKG::boost_exception CONAN_PKG::boost_filesystem CONAN_PKG::boost_foreach CONAN_PKG::boost_function CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_intrusive CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_lexical_cast CONAN_PKG::boost_locale CONAN_PKG::boost_math CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_phoenix CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_rational CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tokenizer CONAN_PKG::boost_tti CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_unordered CONAN_PKG::boost_utility CONAN_PKG::boost_variant CONAN_PKG::boost_winapi CONAN_PKG::bzip2 CONAN_PKG::zlib CONAN_PKG::lzma CONAN_PKG::zstd"
                                  "release" boost_cycle_group_c)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO} CONAN_PKG::boost_algorithm CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_endian CONAN_PKG::boost_exception CONAN_PKG::boost_filesystem CONAN_PKG::boost_foreach CONAN_PKG::boost_function CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_intrusive CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_lexical_cast CONAN_PKG::boost_locale CONAN_PKG::boost_math CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_phoenix CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_rational CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tokenizer CONAN_PKG::boost_tti CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_unordered CONAN_PKG::boost_utility CONAN_PKG::boost_variant CONAN_PKG::boost_winapi CONAN_PKG::bzip2 CONAN_PKG::zlib CONAN_PKG::lzma CONAN_PKG::zstd"
                                  "relwithdebinfo" boost_cycle_group_c)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_C_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_C_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_C_MINSIZEREL} CONAN_PKG::boost_algorithm CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_endian CONAN_PKG::boost_exception CONAN_PKG::boost_filesystem CONAN_PKG::boost_foreach CONAN_PKG::boost_function CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_intrusive CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_lexical_cast CONAN_PKG::boost_locale CONAN_PKG::boost_math CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_phoenix CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_rational CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tokenizer CONAN_PKG::boost_tti CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_unordered CONAN_PKG::boost_utility CONAN_PKG::boost_variant CONAN_PKG::boost_winapi CONAN_PKG::bzip2 CONAN_PKG::zlib CONAN_PKG::lzma CONAN_PKG::zstd"
                                  "minsizerel" boost_cycle_group_c)

    add_library(CONAN_PKG::boost_cycle_group_c INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_cycle_group_c PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_C_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_C_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_algorithm CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_bind CONAN_PKG::boost_chrono CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_endian CONAN_PKG::boost_exception CONAN_PKG::boost_filesystem CONAN_PKG::boost_foreach CONAN_PKG::boost_function CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_intrusive CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_lexical_cast CONAN_PKG::boost_locale CONAN_PKG::boost_math CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_phoenix CONAN_PKG::boost_pool CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_rational CONAN_PKG::boost_regex CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tokenizer CONAN_PKG::boost_tti CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_unordered CONAN_PKG::boost_utility CONAN_PKG::boost_variant CONAN_PKG::boost_winapi CONAN_PKG::bzip2 CONAN_PKG::zlib CONAN_PKG::lzma CONAN_PKG::zstd)
    set_property(TARGET CONAN_PKG::boost_cycle_group_c PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_C}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_C_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_C_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_C_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_cycle_group_c PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_C}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_C_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_C_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_C_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_cycle_group_c PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_C_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_C_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_C_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_C_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_C_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_C_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_C_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_C_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_C_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${CONAN_SYSTEM_LIBS_ZLIB} "
                                  "" zlib)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} "
                                  "debug" zlib)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} "
                                  "release" zlib)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} "
                                  "relwithdebinfo" zlib)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} "
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST} ${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BZIP2}" "${CONAN_LIB_DIRS_BZIP2}"
                                  CONAN_PACKAGE_TARGETS_BZIP2 "${CONAN_SYSTEM_LIBS_BZIP2} "
                                  "" bzip2)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BZIP2_DEBUG}" "${CONAN_LIB_DIRS_BZIP2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_DEBUG "${CONAN_SYSTEM_LIBS_BZIP2_DEBUG} "
                                  "debug" bzip2)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BZIP2_RELEASE}" "${CONAN_LIB_DIRS_BZIP2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELEASE "${CONAN_SYSTEM_LIBS_BZIP2_RELEASE} "
                                  "release" bzip2)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BZIP2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BZIP2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BZIP2_RELWITHDEBINFO} "
                                  "relwithdebinfo" bzip2)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BZIP2_MINSIZEREL}" "${CONAN_LIB_DIRS_BZIP2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL "${CONAN_SYSTEM_LIBS_BZIP2_MINSIZEREL} "
                                  "minsizerel" bzip2)

    add_library(CONAN_PKG::bzip2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BZIP2} ${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST} ${CONAN_EXE_LINKER_FLAGS_BZIP2_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BZIP2_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BZIP2_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BZIP2_LIST} ${CONAN_CXX_FLAGS_BZIP2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BZIP2_RELEASE_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BZIP2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BZIP2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BZIP2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BZIP2_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CHRONO}" "${CONAN_LIB_DIRS_BOOST_CHRONO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CHRONO "${CONAN_SYSTEM_LIBS_BOOST_CHRONO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_ratio CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility CONAN_PKG::boost_winapi"
                                  "" boost_chrono)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CHRONO_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CHRONO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CHRONO_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CHRONO_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_ratio CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility CONAN_PKG::boost_winapi"
                                  "debug" boost_chrono)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CHRONO_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CHRONO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CHRONO_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CHRONO_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_ratio CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility CONAN_PKG::boost_winapi"
                                  "release" boost_chrono)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CHRONO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CHRONO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CHRONO_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CHRONO_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_ratio CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility CONAN_PKG::boost_winapi"
                                  "relwithdebinfo" boost_chrono)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CHRONO_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CHRONO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CHRONO_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CHRONO_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_ratio CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility CONAN_PKG::boost_winapi"
                                  "minsizerel" boost_chrono)

    add_library(CONAN_PKG::boost_chrono INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_chrono PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CHRONO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CHRONO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CHRONO_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CHRONO_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CHRONO_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CHRONO_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CHRONO_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CHRONO_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CHRONO_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CHRONO_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CHRONO_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CHRONO_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CHRONO_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CHRONO_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CHRONO_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_ratio CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility CONAN_PKG::boost_winapi)
    set_property(TARGET CONAN_PKG::boost_chrono PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CHRONO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CHRONO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CHRONO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CHRONO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CHRONO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_chrono PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CHRONO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CHRONO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CHRONO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CHRONO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CHRONO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_chrono PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CHRONO_LIST} ${CONAN_CXX_FLAGS_BOOST_CHRONO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CHRONO_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CHRONO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CHRONO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CHRONO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CHRONO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CHRONO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CHRONO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CHRONO_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_POOL}" "${CONAN_LIB_DIRS_BOOST_POOL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_POOL "${CONAN_SYSTEM_LIBS_BOOST_POOL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_integer CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_winapi"
                                  "" boost_pool)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_POOL_DEBUG}" "${CONAN_LIB_DIRS_BOOST_POOL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_POOL_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_POOL_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_integer CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_winapi"
                                  "debug" boost_pool)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_POOL_RELEASE}" "${CONAN_LIB_DIRS_BOOST_POOL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_POOL_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_POOL_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_integer CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_winapi"
                                  "release" boost_pool)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_POOL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_POOL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_POOL_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_POOL_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_integer CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_winapi"
                                  "relwithdebinfo" boost_pool)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_POOL_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_POOL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_POOL_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_POOL_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_integer CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_winapi"
                                  "minsizerel" boost_pool)

    add_library(CONAN_PKG::boost_pool INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_pool PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_POOL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_POOL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_POOL_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_POOL_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_POOL_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_POOL_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_POOL_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_POOL_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_POOL_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_POOL_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_POOL_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_POOL_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_POOL_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_POOL_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_POOL_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_integer CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_winapi)
    set_property(TARGET CONAN_PKG::boost_pool PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_POOL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_POOL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_POOL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_POOL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_POOL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_pool PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_POOL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_POOL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_POOL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_POOL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_POOL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_pool PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_POOL_LIST} ${CONAN_CXX_FLAGS_BOOST_POOL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_POOL_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_POOL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_POOL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_POOL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_POOL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_POOL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_POOL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_POOL_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ALGORITHM}" "${CONAN_LIB_DIRS_BOOST_ALGORITHM}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM "${CONAN_SYSTEM_LIBS_BOOST_ALGORITHM} CONAN_PKG::boost_cycle_group_a"
                                  "" boost_algorithm)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ALGORITHM_DEBUG}" "${CONAN_LIB_DIRS_BOOST_ALGORITHM_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_ALGORITHM_DEBUG} CONAN_PKG::boost_cycle_group_a"
                                  "debug" boost_algorithm)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ALGORITHM_RELEASE}" "${CONAN_LIB_DIRS_BOOST_ALGORITHM_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_ALGORITHM_RELEASE} CONAN_PKG::boost_cycle_group_a"
                                  "release" boost_algorithm)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ALGORITHM_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_ALGORITHM_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_ALGORITHM_RELWITHDEBINFO} CONAN_PKG::boost_cycle_group_a"
                                  "relwithdebinfo" boost_algorithm)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ALGORITHM_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_ALGORITHM_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_ALGORITHM_MINSIZEREL} CONAN_PKG::boost_cycle_group_a"
                                  "minsizerel" boost_algorithm)

    add_library(CONAN_PKG::boost_algorithm INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_algorithm PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ALGORITHM_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ALGORITHM_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ALGORITHM_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ALGORITHM_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ALGORITHM_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ALGORITHM_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ALGORITHM_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ALGORITHM_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_ALGORITHM_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ALGORITHM_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ALGORITHM_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_cycle_group_a)
    set_property(TARGET CONAN_PKG::boost_algorithm PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_ALGORITHM}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_ALGORITHM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_ALGORITHM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_ALGORITHM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_ALGORITHM_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_algorithm PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_ALGORITHM}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_ALGORITHM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_ALGORITHM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_ALGORITHM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_ALGORITHM_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_algorithm PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_ALGORITHM_LIST} ${CONAN_CXX_FLAGS_BOOST_ALGORITHM_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_ALGORITHM_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_ALGORITHM_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_ALGORITHM_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_ALGORITHM_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_ALGORITHM_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_ALGORITHM_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_ALGORITHM_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_ALGORITHM_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ENDIAN}" "${CONAN_LIB_DIRS_BOOST_ENDIAN}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ENDIAN "${CONAN_SYSTEM_LIBS_BOOST_ENDIAN} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_endian)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ENDIAN_DEBUG}" "${CONAN_LIB_DIRS_BOOST_ENDIAN_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ENDIAN_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_ENDIAN_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_endian)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ENDIAN_RELEASE}" "${CONAN_LIB_DIRS_BOOST_ENDIAN_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ENDIAN_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_ENDIAN_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_endian)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ENDIAN_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_ENDIAN_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ENDIAN_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_ENDIAN_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_endian)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ENDIAN_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_ENDIAN_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ENDIAN_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_ENDIAN_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_endian)

    add_library(CONAN_PKG::boost_endian INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_endian PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_ENDIAN} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ENDIAN_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ENDIAN_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_ENDIAN_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ENDIAN_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ENDIAN_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_ENDIAN_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ENDIAN_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ENDIAN_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_ENDIAN_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ENDIAN_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ENDIAN_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_ENDIAN_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ENDIAN_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ENDIAN_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_endian PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_ENDIAN}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_ENDIAN_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_ENDIAN_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_ENDIAN_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_ENDIAN_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_endian PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_ENDIAN}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_ENDIAN_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_ENDIAN_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_ENDIAN_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_ENDIAN_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_endian PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_ENDIAN_LIST} ${CONAN_CXX_FLAGS_BOOST_ENDIAN_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_ENDIAN_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_ENDIAN_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_ENDIAN_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_ENDIAN_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_ENDIAN_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_ENDIAN_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_ENDIAN_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_ENDIAN_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FILESYSTEM}" "${CONAN_LIB_DIRS_BOOST_FILESYSTEM}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM "${CONAN_SYSTEM_LIBS_BOOST_FILESYSTEM} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "" boost_filesystem)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FILESYSTEM_DEBUG}" "${CONAN_LIB_DIRS_BOOST_FILESYSTEM_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_FILESYSTEM_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "debug" boost_filesystem)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FILESYSTEM_RELEASE}" "${CONAN_LIB_DIRS_BOOST_FILESYSTEM_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_FILESYSTEM_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "release" boost_filesystem)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FILESYSTEM_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_FILESYSTEM_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_FILESYSTEM_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_filesystem)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FILESYSTEM_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_FILESYSTEM_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_FILESYSTEM_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_filesystem)

    add_library(CONAN_PKG::boost_filesystem INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_filesystem PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FILESYSTEM_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FILESYSTEM_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FILESYSTEM_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FILESYSTEM_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FILESYSTEM_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FILESYSTEM_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FILESYSTEM_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FILESYSTEM_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_FILESYSTEM_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FILESYSTEM_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FILESYSTEM_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_io CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_filesystem PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_FILESYSTEM}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_FILESYSTEM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_FILESYSTEM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_FILESYSTEM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_FILESYSTEM_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_filesystem PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_FILESYSTEM}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_FILESYSTEM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_FILESYSTEM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_FILESYSTEM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_FILESYSTEM_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_filesystem PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_FILESYSTEM_LIST} ${CONAN_CXX_FLAGS_BOOST_FILESYSTEM_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_FILESYSTEM_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_FILESYSTEM_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_FILESYSTEM_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_FILESYSTEM_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_FILESYSTEM_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_FILESYSTEM_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_FILESYSTEM_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_FILESYSTEM_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FOREACH}" "${CONAN_LIB_DIRS_BOOST_FOREACH}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FOREACH "${CONAN_SYSTEM_LIBS_BOOST_FOREACH} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_range CONAN_PKG::boost_type_traits"
                                  "" boost_foreach)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FOREACH_DEBUG}" "${CONAN_LIB_DIRS_BOOST_FOREACH_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FOREACH_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_FOREACH_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_range CONAN_PKG::boost_type_traits"
                                  "debug" boost_foreach)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FOREACH_RELEASE}" "${CONAN_LIB_DIRS_BOOST_FOREACH_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FOREACH_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_FOREACH_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_range CONAN_PKG::boost_type_traits"
                                  "release" boost_foreach)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FOREACH_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_FOREACH_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FOREACH_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_FOREACH_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_range CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_foreach)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FOREACH_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_FOREACH_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FOREACH_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_FOREACH_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_range CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_foreach)

    add_library(CONAN_PKG::boost_foreach INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_foreach PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_FOREACH} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FOREACH_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FOREACH_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_FOREACH_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FOREACH_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FOREACH_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_FOREACH_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FOREACH_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FOREACH_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_FOREACH_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FOREACH_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FOREACH_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_FOREACH_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FOREACH_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FOREACH_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_range CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_foreach PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_FOREACH}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_FOREACH_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_FOREACH_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_FOREACH_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_FOREACH_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_foreach PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_FOREACH}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_FOREACH_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_FOREACH_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_FOREACH_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_FOREACH_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_foreach PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_FOREACH_LIST} ${CONAN_CXX_FLAGS_BOOST_FOREACH_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_FOREACH_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_FOREACH_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_FOREACH_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_FOREACH_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_FOREACH_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_FOREACH_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_FOREACH_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_FOREACH_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LEXICAL_CAST}" "${CONAN_LIB_DIRS_BOOST_LEXICAL_CAST}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST "${CONAN_SYSTEM_LIBS_BOOST_LEXICAL_CAST} CONAN_PKG::boost_cycle_group_b"
                                  "" boost_lexical_cast)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LEXICAL_CAST_DEBUG}" "${CONAN_LIB_DIRS_BOOST_LEXICAL_CAST_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_LEXICAL_CAST_DEBUG} CONAN_PKG::boost_cycle_group_b"
                                  "debug" boost_lexical_cast)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LEXICAL_CAST_RELEASE}" "${CONAN_LIB_DIRS_BOOST_LEXICAL_CAST_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_LEXICAL_CAST_RELEASE} CONAN_PKG::boost_cycle_group_b"
                                  "release" boost_lexical_cast)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LEXICAL_CAST_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_LEXICAL_CAST_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_LEXICAL_CAST_RELWITHDEBINFO} CONAN_PKG::boost_cycle_group_b"
                                  "relwithdebinfo" boost_lexical_cast)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LEXICAL_CAST_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_LEXICAL_CAST_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_LEXICAL_CAST_MINSIZEREL} CONAN_PKG::boost_cycle_group_b"
                                  "minsizerel" boost_lexical_cast)

    add_library(CONAN_PKG::boost_lexical_cast INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_lexical_cast PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LEXICAL_CAST_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LEXICAL_CAST_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LEXICAL_CAST_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LEXICAL_CAST_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LEXICAL_CAST_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LEXICAL_CAST_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LEXICAL_CAST_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LEXICAL_CAST_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_LEXICAL_CAST_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LEXICAL_CAST_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LEXICAL_CAST_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_cycle_group_b)
    set_property(TARGET CONAN_PKG::boost_lexical_cast PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_LEXICAL_CAST}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_LEXICAL_CAST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_LEXICAL_CAST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_LEXICAL_CAST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_LEXICAL_CAST_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_lexical_cast PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_LEXICAL_CAST}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_LEXICAL_CAST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_LEXICAL_CAST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_LEXICAL_CAST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_LEXICAL_CAST_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_lexical_cast PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_LEXICAL_CAST_LIST} ${CONAN_CXX_FLAGS_BOOST_LEXICAL_CAST_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_LEXICAL_CAST_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_LEXICAL_CAST_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_LEXICAL_CAST_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_LEXICAL_CAST_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_LEXICAL_CAST_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_LEXICAL_CAST_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_LEXICAL_CAST_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_LEXICAL_CAST_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LOCALE}" "${CONAN_LIB_DIRS_BOOST_LOCALE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LOCALE "${CONAN_SYSTEM_LIBS_BOOST_LOCALE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "" boost_locale)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LOCALE_DEBUG}" "${CONAN_LIB_DIRS_BOOST_LOCALE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LOCALE_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_LOCALE_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "debug" boost_locale)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LOCALE_RELEASE}" "${CONAN_LIB_DIRS_BOOST_LOCALE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LOCALE_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_LOCALE_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "release" boost_locale)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LOCALE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_LOCALE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LOCALE_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_LOCALE_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_locale)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LOCALE_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_LOCALE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LOCALE_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_LOCALE_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_locale)

    add_library(CONAN_PKG::boost_locale INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_locale PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_LOCALE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LOCALE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LOCALE_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_LOCALE_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LOCALE_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LOCALE_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_LOCALE_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LOCALE_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LOCALE_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_LOCALE_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LOCALE_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LOCALE_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_LOCALE_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LOCALE_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LOCALE_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_system CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_locale PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_LOCALE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_LOCALE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_LOCALE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_LOCALE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_LOCALE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_locale PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_LOCALE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_LOCALE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_LOCALE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_LOCALE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_LOCALE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_locale PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_LOCALE_LIST} ${CONAN_CXX_FLAGS_BOOST_LOCALE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_LOCALE_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_LOCALE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_LOCALE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_LOCALE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_LOCALE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_LOCALE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_LOCALE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_LOCALE_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MATH}" "${CONAN_LIB_DIRS_BOOST_MATH}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MATH "${CONAN_SYSTEM_LIBS_BOOST_MATH} CONAN_PKG::boost_cycle_group_b"
                                  "" boost_math)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MATH_DEBUG}" "${CONAN_LIB_DIRS_BOOST_MATH_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MATH_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_MATH_DEBUG} CONAN_PKG::boost_cycle_group_b"
                                  "debug" boost_math)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MATH_RELEASE}" "${CONAN_LIB_DIRS_BOOST_MATH_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MATH_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_MATH_RELEASE} CONAN_PKG::boost_cycle_group_b"
                                  "release" boost_math)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MATH_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_MATH_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MATH_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_MATH_RELWITHDEBINFO} CONAN_PKG::boost_cycle_group_b"
                                  "relwithdebinfo" boost_math)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MATH_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_MATH_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MATH_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_MATH_MINSIZEREL} CONAN_PKG::boost_cycle_group_b"
                                  "minsizerel" boost_math)

    add_library(CONAN_PKG::boost_math INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_math PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_MATH} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MATH_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MATH_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_MATH_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MATH_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MATH_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_MATH_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MATH_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MATH_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_MATH_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MATH_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MATH_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_MATH_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MATH_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MATH_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_cycle_group_b)
    set_property(TARGET CONAN_PKG::boost_math PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_MATH}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_MATH_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_MATH_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_MATH_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_MATH_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_math PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_MATH}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_MATH_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_MATH_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_MATH_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_MATH_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_math PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_MATH_LIST} ${CONAN_CXX_FLAGS_BOOST_MATH_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_MATH_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_MATH_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_MATH_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_MATH_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_MATH_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_MATH_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_MATH_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_MATH_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PHOENIX}" "${CONAN_LIB_DIRS_BOOST_PHOENIX}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PHOENIX "${CONAN_SYSTEM_LIBS_BOOST_PHOENIX} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_function CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_phoenix)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PHOENIX_DEBUG}" "${CONAN_LIB_DIRS_BOOST_PHOENIX_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PHOENIX_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_PHOENIX_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_function CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_phoenix)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PHOENIX_RELEASE}" "${CONAN_LIB_DIRS_BOOST_PHOENIX_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PHOENIX_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_PHOENIX_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_function CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_phoenix)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PHOENIX_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_PHOENIX_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PHOENIX_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_PHOENIX_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_function CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_phoenix)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PHOENIX_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_PHOENIX_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PHOENIX_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_PHOENIX_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_function CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_phoenix)

    add_library(CONAN_PKG::boost_phoenix INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_phoenix PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_PHOENIX} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PHOENIX_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PHOENIX_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_PHOENIX_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PHOENIX_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PHOENIX_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_PHOENIX_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PHOENIX_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PHOENIX_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_PHOENIX_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PHOENIX_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PHOENIX_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_PHOENIX_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PHOENIX_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PHOENIX_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_function CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_proto CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_phoenix PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_PHOENIX}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_PHOENIX_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_PHOENIX_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_PHOENIX_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_PHOENIX_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_phoenix PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_PHOENIX}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_PHOENIX_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_PHOENIX_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_PHOENIX_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_PHOENIX_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_phoenix PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_PHOENIX_LIST} ${CONAN_CXX_FLAGS_BOOST_PHOENIX_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_PHOENIX_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_PHOENIX_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_PHOENIX_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_PHOENIX_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_PHOENIX_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_PHOENIX_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_PHOENIX_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_PHOENIX_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TOKENIZER}" "${CONAN_LIB_DIRS_BOOST_TOKENIZER}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER "${CONAN_SYSTEM_LIBS_BOOST_TOKENIZER} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "" boost_tokenizer)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TOKENIZER_DEBUG}" "${CONAN_LIB_DIRS_BOOST_TOKENIZER_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_TOKENIZER_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "debug" boost_tokenizer)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TOKENIZER_RELEASE}" "${CONAN_LIB_DIRS_BOOST_TOKENIZER_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_TOKENIZER_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "release" boost_tokenizer)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TOKENIZER_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_TOKENIZER_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_TOKENIZER_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_tokenizer)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TOKENIZER_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_TOKENIZER_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_TOKENIZER_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_tokenizer)

    add_library(CONAN_PKG::boost_tokenizer INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_tokenizer PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TOKENIZER_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TOKENIZER_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TOKENIZER_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TOKENIZER_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TOKENIZER_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TOKENIZER_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TOKENIZER_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TOKENIZER_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_TOKENIZER_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TOKENIZER_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TOKENIZER_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_tokenizer PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_TOKENIZER}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_TOKENIZER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_TOKENIZER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_TOKENIZER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_TOKENIZER_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_tokenizer PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_TOKENIZER}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_TOKENIZER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_TOKENIZER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_TOKENIZER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_TOKENIZER_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_tokenizer PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_TOKENIZER_LIST} ${CONAN_CXX_FLAGS_BOOST_TOKENIZER_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_TOKENIZER_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_TOKENIZER_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_TOKENIZER_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_TOKENIZER_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_TOKENIZER_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_TOKENIZER_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_TOKENIZER_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_TOKENIZER_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TTI}" "${CONAN_LIB_DIRS_BOOST_TTI}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TTI "${CONAN_SYSTEM_LIBS_BOOST_TTI} CONAN_PKG::boost_config CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "" boost_tti)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TTI_DEBUG}" "${CONAN_LIB_DIRS_BOOST_TTI_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TTI_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_TTI_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "debug" boost_tti)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TTI_RELEASE}" "${CONAN_LIB_DIRS_BOOST_TTI_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TTI_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_TTI_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "release" boost_tti)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TTI_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_TTI_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TTI_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_TTI_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_tti)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TTI_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_TTI_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TTI_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_TTI_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_tti)

    add_library(CONAN_PKG::boost_tti INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_tti PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_TTI} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TTI_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TTI_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_TTI_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TTI_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TTI_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_TTI_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TTI_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TTI_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_TTI_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TTI_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TTI_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_TTI_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TTI_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TTI_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_tti PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_TTI}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_TTI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_TTI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_TTI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_TTI_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_tti PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_TTI}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_TTI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_TTI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_TTI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_TTI_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_tti PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_TTI_LIST} ${CONAN_CXX_FLAGS_BOOST_TTI_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_TTI_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_TTI_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_TTI_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_TTI_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_TTI_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_TTI_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_TTI_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_TTI_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_VARIANT}" "${CONAN_LIB_DIRS_BOOST_VARIANT}"
                                  CONAN_PACKAGE_TARGETS_BOOST_VARIANT "${CONAN_SYSTEM_LIBS_BOOST_VARIANT} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_variant)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_VARIANT_DEBUG}" "${CONAN_LIB_DIRS_BOOST_VARIANT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_VARIANT_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_VARIANT_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_variant)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_VARIANT_RELEASE}" "${CONAN_LIB_DIRS_BOOST_VARIANT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_VARIANT_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_VARIANT_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_variant)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_VARIANT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_VARIANT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_VARIANT_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_VARIANT_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_variant)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_VARIANT_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_VARIANT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_VARIANT_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_VARIANT_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_variant)

    add_library(CONAN_PKG::boost_variant INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_variant PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_VARIANT} ${CONAN_SHARED_LINKER_FLAGS_BOOST_VARIANT_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_VARIANT_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_VARIANT_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_VARIANT_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_VARIANT_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_VARIANT_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_VARIANT_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_VARIANT_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_VARIANT_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_VARIANT_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_VARIANT_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_VARIANT_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_VARIANT_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_VARIANT_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_variant PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_VARIANT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_VARIANT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_VARIANT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_VARIANT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_VARIANT_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_variant PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_VARIANT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_VARIANT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_VARIANT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_VARIANT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_VARIANT_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_variant PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_VARIANT_LIST} ${CONAN_CXX_FLAGS_BOOST_VARIANT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_VARIANT_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_VARIANT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_VARIANT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_VARIANT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_VARIANT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_VARIANT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_VARIANT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_VARIANT_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LZMA}" "${CONAN_LIB_DIRS_LZMA}"
                                  CONAN_PACKAGE_TARGETS_LZMA "${CONAN_SYSTEM_LIBS_LZMA} "
                                  "" lzma)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LZMA_DEBUG}" "${CONAN_LIB_DIRS_LZMA_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LZMA_DEBUG "${CONAN_SYSTEM_LIBS_LZMA_DEBUG} "
                                  "debug" lzma)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LZMA_RELEASE}" "${CONAN_LIB_DIRS_LZMA_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LZMA_RELEASE "${CONAN_SYSTEM_LIBS_LZMA_RELEASE} "
                                  "release" lzma)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LZMA_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LZMA_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LZMA_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LZMA_RELWITHDEBINFO} "
                                  "relwithdebinfo" lzma)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_LZMA_MINSIZEREL}" "${CONAN_LIB_DIRS_LZMA_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LZMA_MINSIZEREL "${CONAN_SYSTEM_LIBS_LZMA_MINSIZEREL} "
                                  "minsizerel" lzma)

    add_library(CONAN_PKG::lzma INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::lzma PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LZMA} ${CONAN_SHARED_LINKER_FLAGS_LZMA_LIST} ${CONAN_EXE_LINKER_FLAGS_LZMA_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LZMA_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_LZMA_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_LZMA_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LZMA_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_LZMA_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_LZMA_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LZMA_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_LZMA_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_LZMA_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LZMA_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_LZMA_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_LZMA_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::lzma PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LZMA}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LZMA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LZMA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LZMA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LZMA_DEBUG}>)
    set_property(TARGET CONAN_PKG::lzma PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LZMA}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LZMA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LZMA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LZMA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LZMA_DEBUG}>)
    set_property(TARGET CONAN_PKG::lzma PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LZMA_LIST} ${CONAN_CXX_FLAGS_LZMA_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LZMA_RELEASE_LIST} ${CONAN_CXX_FLAGS_LZMA_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LZMA_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LZMA_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LZMA_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LZMA_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LZMA_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LZMA_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZSTD}" "${CONAN_LIB_DIRS_ZSTD}"
                                  CONAN_PACKAGE_TARGETS_ZSTD "${CONAN_SYSTEM_LIBS_ZSTD} "
                                  "" zstd)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZSTD_DEBUG}" "${CONAN_LIB_DIRS_ZSTD_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_DEBUG "${CONAN_SYSTEM_LIBS_ZSTD_DEBUG} "
                                  "debug" zstd)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZSTD_RELEASE}" "${CONAN_LIB_DIRS_ZSTD_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELEASE "${CONAN_SYSTEM_LIBS_ZSTD_RELEASE} "
                                  "release" zstd)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZSTD_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZSTD_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZSTD_RELWITHDEBINFO} "
                                  "relwithdebinfo" zstd)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_ZSTD_MINSIZEREL}" "${CONAN_LIB_DIRS_ZSTD_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZSTD_MINSIZEREL} "
                                  "minsizerel" zstd)

    add_library(CONAN_PKG::zstd INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZSTD} ${CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST} ${CONAN_EXE_LINKER_FLAGS_ZSTD_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZSTD_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_ZSTD_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZSTD_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_ZSTD_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_ZSTD_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZSTD_LIST} ${CONAN_CXX_FLAGS_ZSTD_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZSTD_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZSTD_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZSTD_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZSTD_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZSTD_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIO}" "${CONAN_LIB_DIRS_BOOST_RATIO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIO "${CONAN_SYSTEM_LIBS_BOOST_RATIO} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_mpl CONAN_PKG::boost_rational CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "" boost_ratio)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIO_DEBUG}" "${CONAN_LIB_DIRS_BOOST_RATIO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIO_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_RATIO_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_mpl CONAN_PKG::boost_rational CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "debug" boost_ratio)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIO_RELEASE}" "${CONAN_LIB_DIRS_BOOST_RATIO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIO_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_RATIO_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_mpl CONAN_PKG::boost_rational CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "release" boost_ratio)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_RATIO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIO_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_RATIO_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_mpl CONAN_PKG::boost_rational CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_ratio)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIO_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_RATIO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIO_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_RATIO_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_mpl CONAN_PKG::boost_rational CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_ratio)

    add_library(CONAN_PKG::boost_ratio INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_ratio PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_RATIO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIO_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_RATIO_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIO_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIO_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_RATIO_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIO_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_RATIO_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIO_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIO_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_RATIO_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIO_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIO_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_mpl CONAN_PKG::boost_rational CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_ratio PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_RATIO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_RATIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_RATIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_RATIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_RATIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_ratio PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_RATIO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_RATIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_RATIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_RATIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_RATIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_ratio PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_RATIO_LIST} ${CONAN_CXX_FLAGS_BOOST_RATIO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_RATIO_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_RATIO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_RATIO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_RATIO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_RATIO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_RATIO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_RATIO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_RATIO_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SYSTEM}" "${CONAN_LIB_DIRS_BOOST_SYSTEM}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SYSTEM "${CONAN_SYSTEM_LIBS_BOOST_SYSTEM} CONAN_PKG::boost_config CONAN_PKG::boost_winapi"
                                  "" boost_system)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SYSTEM_DEBUG}" "${CONAN_LIB_DIRS_BOOST_SYSTEM_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SYSTEM_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_SYSTEM_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_winapi"
                                  "debug" boost_system)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SYSTEM_RELEASE}" "${CONAN_LIB_DIRS_BOOST_SYSTEM_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SYSTEM_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_SYSTEM_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_winapi"
                                  "release" boost_system)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SYSTEM_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_SYSTEM_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SYSTEM_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_SYSTEM_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_winapi"
                                  "relwithdebinfo" boost_system)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SYSTEM_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_SYSTEM_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SYSTEM_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_SYSTEM_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_winapi"
                                  "minsizerel" boost_system)

    add_library(CONAN_PKG::boost_system INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_system PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_SYSTEM} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SYSTEM_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SYSTEM_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_SYSTEM_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SYSTEM_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SYSTEM_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_SYSTEM_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SYSTEM_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SYSTEM_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_SYSTEM_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SYSTEM_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SYSTEM_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_SYSTEM_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SYSTEM_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SYSTEM_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_winapi)
    set_property(TARGET CONAN_PKG::boost_system PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_SYSTEM}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_SYSTEM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_SYSTEM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_SYSTEM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_SYSTEM_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_system PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_SYSTEM}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_SYSTEM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_SYSTEM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_SYSTEM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_SYSTEM_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_system PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_SYSTEM_LIST} ${CONAN_CXX_FLAGS_BOOST_SYSTEM_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_SYSTEM_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_SYSTEM_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_SYSTEM_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_SYSTEM_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_SYSTEM_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_SYSTEM_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_SYSTEM_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_SYSTEM_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_IO}" "${CONAN_LIB_DIRS_BOOST_IO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_IO "${CONAN_SYSTEM_LIBS_BOOST_IO} CONAN_PKG::boost_config"
                                  "" boost_io)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_IO_DEBUG}" "${CONAN_LIB_DIRS_BOOST_IO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_IO_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_IO_DEBUG} CONAN_PKG::boost_config"
                                  "debug" boost_io)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_IO_RELEASE}" "${CONAN_LIB_DIRS_BOOST_IO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_IO_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_IO_RELEASE} CONAN_PKG::boost_config"
                                  "release" boost_io)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_IO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_IO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_IO_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_IO_RELWITHDEBINFO} CONAN_PKG::boost_config"
                                  "relwithdebinfo" boost_io)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_IO_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_IO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_IO_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_IO_MINSIZEREL} CONAN_PKG::boost_config"
                                  "minsizerel" boost_io)

    add_library(CONAN_PKG::boost_io INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_io PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_IO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_IO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_IO_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_IO_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_IO_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_IO_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_IO_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_IO_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_IO_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_IO_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_IO_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_IO_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_IO_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_IO_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_IO_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config)
    set_property(TARGET CONAN_PKG::boost_io PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_IO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_IO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_IO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_IO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_IO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_io PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_IO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_IO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_IO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_IO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_IO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_io PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_IO_LIST} ${CONAN_CXX_FLAGS_BOOST_IO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_IO_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_IO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_IO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_IO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_IO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_IO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_IO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_IO_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_B}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_B}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_B} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_lambda CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_predef CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "" boost_cycle_group_b)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_B_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_B_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_B_DEBUG} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_lambda CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_predef CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "debug" boost_cycle_group_b)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_B_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_B_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_B_RELEASE} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_lambda CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_predef CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "release" boost_cycle_group_b)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_lambda CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_predef CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_cycle_group_b)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_B_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_B_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_B_MINSIZEREL} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_lambda CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_predef CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_cycle_group_b)

    add_library(CONAN_PKG::boost_cycle_group_b INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_cycle_group_b PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_B_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_B_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_atomic CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_fusion CONAN_PKG::boost_integer CONAN_PKG::boost_lambda CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_predef CONAN_PKG::boost_range CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_cycle_group_b PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_B}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_B_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_B_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_B_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_cycle_group_b PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_B}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_B_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_B_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_B_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_cycle_group_b PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_B_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_B_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_B_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_B_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_B_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_B_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_B_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_B_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_B_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PROTO}" "${CONAN_LIB_DIRS_BOOST_PROTO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PROTO "${CONAN_SYSTEM_LIBS_BOOST_PROTO} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_range CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "" boost_proto)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PROTO_DEBUG}" "${CONAN_LIB_DIRS_BOOST_PROTO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PROTO_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_PROTO_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_range CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "debug" boost_proto)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PROTO_RELEASE}" "${CONAN_LIB_DIRS_BOOST_PROTO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PROTO_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_PROTO_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_range CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "release" boost_proto)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PROTO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_PROTO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PROTO_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_PROTO_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_range CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_proto)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PROTO_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_PROTO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PROTO_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_PROTO_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_range CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "minsizerel" boost_proto)

    add_library(CONAN_PKG::boost_proto INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_proto PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_PROTO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PROTO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PROTO_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_PROTO_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PROTO_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PROTO_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_PROTO_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PROTO_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PROTO_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_PROTO_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PROTO_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PROTO_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_PROTO_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PROTO_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PROTO_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_range CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_proto PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_PROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_PROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_PROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_PROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_PROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_proto PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_PROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_PROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_PROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_PROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_PROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_proto PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_PROTO_LIST} ${CONAN_CXX_FLAGS_BOOST_PROTO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_PROTO_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_PROTO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_PROTO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_PROTO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_PROTO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_PROTO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_PROTO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_PROTO_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIONAL}" "${CONAN_LIB_DIRS_BOOST_RATIONAL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIONAL "${CONAN_SYSTEM_LIBS_BOOST_RATIONAL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_rational)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIONAL_DEBUG}" "${CONAN_LIB_DIRS_BOOST_RATIONAL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIONAL_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_RATIONAL_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_rational)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIONAL_RELEASE}" "${CONAN_LIB_DIRS_BOOST_RATIONAL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIONAL_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_RATIONAL_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_rational)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIONAL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_RATIONAL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIONAL_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_RATIONAL_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_rational)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RATIONAL_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_RATIONAL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RATIONAL_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_RATIONAL_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_rational)

    add_library(CONAN_PKG::boost_rational INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_rational PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_RATIONAL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIONAL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIONAL_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_RATIONAL_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIONAL_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIONAL_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_RATIONAL_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIONAL_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIONAL_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_RATIONAL_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIONAL_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIONAL_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_RATIONAL_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RATIONAL_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RATIONAL_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_rational PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_RATIONAL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_RATIONAL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_RATIONAL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_RATIONAL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_RATIONAL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_rational PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_RATIONAL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_RATIONAL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_RATIONAL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_RATIONAL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_RATIONAL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_rational PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_RATIONAL_LIST} ${CONAN_CXX_FLAGS_BOOST_RATIONAL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_RATIONAL_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_RATIONAL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_RATIONAL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_RATIONAL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_RATIONAL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_RATIONAL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_RATIONAL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_RATIONAL_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_WINAPI}" "${CONAN_LIB_DIRS_BOOST_WINAPI}"
                                  CONAN_PACKAGE_TARGETS_BOOST_WINAPI "${CONAN_SYSTEM_LIBS_BOOST_WINAPI} CONAN_PKG::boost_config CONAN_PKG::boost_predef"
                                  "" boost_winapi)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_WINAPI_DEBUG}" "${CONAN_LIB_DIRS_BOOST_WINAPI_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_WINAPI_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_WINAPI_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_predef"
                                  "debug" boost_winapi)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_WINAPI_RELEASE}" "${CONAN_LIB_DIRS_BOOST_WINAPI_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_WINAPI_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_WINAPI_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_predef"
                                  "release" boost_winapi)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_WINAPI_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_WINAPI_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_WINAPI_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_WINAPI_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_predef"
                                  "relwithdebinfo" boost_winapi)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_WINAPI_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_WINAPI_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_WINAPI_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_WINAPI_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_predef"
                                  "minsizerel" boost_winapi)

    add_library(CONAN_PKG::boost_winapi INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_winapi PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_WINAPI} ${CONAN_SHARED_LINKER_FLAGS_BOOST_WINAPI_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_WINAPI_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_WINAPI_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_WINAPI_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_WINAPI_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_WINAPI_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_WINAPI_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_WINAPI_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_WINAPI_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_WINAPI_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_WINAPI_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_WINAPI_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_WINAPI_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_WINAPI_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_predef)
    set_property(TARGET CONAN_PKG::boost_winapi PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_WINAPI}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_WINAPI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_WINAPI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_WINAPI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_WINAPI_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_winapi PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_WINAPI}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_WINAPI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_WINAPI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_WINAPI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_WINAPI_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_winapi PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_WINAPI_LIST} ${CONAN_CXX_FLAGS_BOOST_WINAPI_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_WINAPI_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_WINAPI_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_WINAPI_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_WINAPI_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_WINAPI_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_WINAPI_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_WINAPI_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_WINAPI_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ATOMIC}" "${CONAN_LIB_DIRS_BOOST_ATOMIC}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ATOMIC "${CONAN_SYSTEM_LIBS_BOOST_ATOMIC} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_type_traits"
                                  "" boost_atomic)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ATOMIC_DEBUG}" "${CONAN_LIB_DIRS_BOOST_ATOMIC_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ATOMIC_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_ATOMIC_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_type_traits"
                                  "debug" boost_atomic)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ATOMIC_RELEASE}" "${CONAN_LIB_DIRS_BOOST_ATOMIC_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ATOMIC_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_ATOMIC_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_type_traits"
                                  "release" boost_atomic)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ATOMIC_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_ATOMIC_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ATOMIC_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_ATOMIC_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_atomic)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ATOMIC_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_ATOMIC_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ATOMIC_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_ATOMIC_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_atomic)

    add_library(CONAN_PKG::boost_atomic INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_atomic PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_ATOMIC} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ATOMIC_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ATOMIC_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_ATOMIC_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ATOMIC_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ATOMIC_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_ATOMIC_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ATOMIC_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ATOMIC_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_ATOMIC_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ATOMIC_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ATOMIC_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_ATOMIC_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ATOMIC_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ATOMIC_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_atomic PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_ATOMIC}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_ATOMIC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_ATOMIC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_ATOMIC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_ATOMIC_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_atomic PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_ATOMIC}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_ATOMIC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_ATOMIC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_ATOMIC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_ATOMIC_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_atomic PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_ATOMIC_LIST} ${CONAN_CXX_FLAGS_BOOST_ATOMIC_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_ATOMIC_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_ATOMIC_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_ATOMIC_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_ATOMIC_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_ATOMIC_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_ATOMIC_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_ATOMIC_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_ATOMIC_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RANGE}" "${CONAN_LIB_DIRS_BOOST_RANGE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RANGE "${CONAN_SYSTEM_LIBS_BOOST_RANGE} CONAN_PKG::boost_cycle_group_a"
                                  "" boost_range)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RANGE_DEBUG}" "${CONAN_LIB_DIRS_BOOST_RANGE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RANGE_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_RANGE_DEBUG} CONAN_PKG::boost_cycle_group_a"
                                  "debug" boost_range)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RANGE_RELEASE}" "${CONAN_LIB_DIRS_BOOST_RANGE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RANGE_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_RANGE_RELEASE} CONAN_PKG::boost_cycle_group_a"
                                  "release" boost_range)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RANGE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_RANGE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RANGE_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_RANGE_RELWITHDEBINFO} CONAN_PKG::boost_cycle_group_a"
                                  "relwithdebinfo" boost_range)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_RANGE_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_RANGE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RANGE_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_RANGE_MINSIZEREL} CONAN_PKG::boost_cycle_group_a"
                                  "minsizerel" boost_range)

    add_library(CONAN_PKG::boost_range INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_range PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_RANGE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RANGE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RANGE_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_RANGE_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RANGE_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RANGE_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_RANGE_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RANGE_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RANGE_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_RANGE_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RANGE_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RANGE_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_RANGE_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_RANGE_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_RANGE_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_cycle_group_a)
    set_property(TARGET CONAN_PKG::boost_range PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_RANGE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_RANGE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_RANGE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_RANGE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_RANGE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_range PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_RANGE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_RANGE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_RANGE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_RANGE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_RANGE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_range PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_RANGE_LIST} ${CONAN_CXX_FLAGS_BOOST_RANGE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_RANGE_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_RANGE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_RANGE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_RANGE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_RANGE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_RANGE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_RANGE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_RANGE_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LAMBDA}" "${CONAN_LIB_DIRS_BOOST_LAMBDA}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LAMBDA "${CONAN_SYSTEM_LIBS_BOOST_LAMBDA} CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_lambda)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LAMBDA_DEBUG}" "${CONAN_LIB_DIRS_BOOST_LAMBDA_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LAMBDA_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_LAMBDA_DEBUG} CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_lambda)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LAMBDA_RELEASE}" "${CONAN_LIB_DIRS_BOOST_LAMBDA_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LAMBDA_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_LAMBDA_RELEASE} CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_lambda)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LAMBDA_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_LAMBDA_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LAMBDA_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_LAMBDA_RELWITHDEBINFO} CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_lambda)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_LAMBDA_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_LAMBDA_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_LAMBDA_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_LAMBDA_MINSIZEREL} CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_lambda)

    add_library(CONAN_PKG::boost_lambda INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_lambda PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_LAMBDA} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LAMBDA_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LAMBDA_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_LAMBDA_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LAMBDA_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LAMBDA_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_LAMBDA_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LAMBDA_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LAMBDA_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_LAMBDA_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LAMBDA_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LAMBDA_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_LAMBDA_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_LAMBDA_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_LAMBDA_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_lambda PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_LAMBDA}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_LAMBDA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_LAMBDA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_LAMBDA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_LAMBDA_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_lambda PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_LAMBDA}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_LAMBDA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_LAMBDA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_LAMBDA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_LAMBDA_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_lambda PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_LAMBDA_LIST} ${CONAN_CXX_FLAGS_BOOST_LAMBDA_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_LAMBDA_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_LAMBDA_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_LAMBDA_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_LAMBDA_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_LAMBDA_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_LAMBDA_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_LAMBDA_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_LAMBDA_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_A}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_A}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_A} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_exception CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_preprocessor CONAN_PKG::boost_regex CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_unordered CONAN_PKG::boost_utility"
                                  "" boost_cycle_group_a)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_A_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_A_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_A_DEBUG} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_exception CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_preprocessor CONAN_PKG::boost_regex CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_unordered CONAN_PKG::boost_utility"
                                  "debug" boost_cycle_group_a)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_A_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_A_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_A_RELEASE} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_exception CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_preprocessor CONAN_PKG::boost_regex CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_unordered CONAN_PKG::boost_utility"
                                  "release" boost_cycle_group_a)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_exception CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_preprocessor CONAN_PKG::boost_regex CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_unordered CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_cycle_group_a)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CYCLE_GROUP_A_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CYCLE_GROUP_A_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CYCLE_GROUP_A_MINSIZEREL} CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_exception CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_preprocessor CONAN_PKG::boost_regex CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_unordered CONAN_PKG::boost_utility"
                                  "minsizerel" boost_cycle_group_a)

    add_library(CONAN_PKG::boost_cycle_group_a INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_cycle_group_a PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CYCLE_GROUP_A_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CYCLE_GROUP_A_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_array CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_exception CONAN_PKG::boost_function CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_optional CONAN_PKG::boost_preprocessor CONAN_PKG::boost_regex CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_unordered CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_cycle_group_a PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_A}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_A_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_A_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CYCLE_GROUP_A_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_cycle_group_a PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_A}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_A_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_A_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CYCLE_GROUP_A_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_cycle_group_a PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_A_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_A_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_A_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_A_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_A_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_A_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_A_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CYCLE_GROUP_A_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CYCLE_GROUP_A_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ARRAY}" "${CONAN_LIB_DIRS_BOOST_ARRAY}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ARRAY "${CONAN_SYSTEM_LIBS_BOOST_ARRAY} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception"
                                  "" boost_array)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ARRAY_DEBUG}" "${CONAN_LIB_DIRS_BOOST_ARRAY_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ARRAY_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_ARRAY_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception"
                                  "debug" boost_array)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ARRAY_RELEASE}" "${CONAN_LIB_DIRS_BOOST_ARRAY_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ARRAY_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_ARRAY_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception"
                                  "release" boost_array)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ARRAY_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_ARRAY_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ARRAY_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_ARRAY_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception"
                                  "relwithdebinfo" boost_array)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ARRAY_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_ARRAY_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ARRAY_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_ARRAY_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception"
                                  "minsizerel" boost_array)

    add_library(CONAN_PKG::boost_array INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_array PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_ARRAY} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ARRAY_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ARRAY_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_ARRAY_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ARRAY_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ARRAY_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_ARRAY_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ARRAY_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ARRAY_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_ARRAY_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ARRAY_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ARRAY_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_ARRAY_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ARRAY_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ARRAY_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception)
    set_property(TARGET CONAN_PKG::boost_array PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_ARRAY}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_ARRAY_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_ARRAY_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_ARRAY_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_ARRAY_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_array PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_ARRAY}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_ARRAY_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_ARRAY_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_ARRAY_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_ARRAY_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_array PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_ARRAY_LIST} ${CONAN_CXX_FLAGS_BOOST_ARRAY_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_ARRAY_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_ARRAY_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_ARRAY_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_ARRAY_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_ARRAY_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_ARRAY_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_ARRAY_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_ARRAY_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_EXCEPTION}" "${CONAN_LIB_DIRS_BOOST_EXCEPTION}"
                                  CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION "${CONAN_SYSTEM_LIBS_BOOST_EXCEPTION} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "" boost_exception)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_EXCEPTION_DEBUG}" "${CONAN_LIB_DIRS_BOOST_EXCEPTION_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_EXCEPTION_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "debug" boost_exception)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_EXCEPTION_RELEASE}" "${CONAN_LIB_DIRS_BOOST_EXCEPTION_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_EXCEPTION_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "release" boost_exception)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_EXCEPTION_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_EXCEPTION_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_EXCEPTION_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_exception)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_EXCEPTION_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_EXCEPTION_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_EXCEPTION_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_exception)

    add_library(CONAN_PKG::boost_exception INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_exception PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION} ${CONAN_SHARED_LINKER_FLAGS_BOOST_EXCEPTION_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_EXCEPTION_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_EXCEPTION_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_EXCEPTION_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_EXCEPTION_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_EXCEPTION_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_EXCEPTION_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_EXCEPTION_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_EXCEPTION_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_EXCEPTION_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_EXCEPTION_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_exception PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_EXCEPTION}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_EXCEPTION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_EXCEPTION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_EXCEPTION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_EXCEPTION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_exception PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_EXCEPTION}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_EXCEPTION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_EXCEPTION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_EXCEPTION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_EXCEPTION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_exception PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_EXCEPTION_LIST} ${CONAN_CXX_FLAGS_BOOST_EXCEPTION_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_EXCEPTION_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_EXCEPTION_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_EXCEPTION_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_EXCEPTION_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_EXCEPTION_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_EXCEPTION_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_EXCEPTION_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_EXCEPTION_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION}" "${CONAN_LIB_DIRS_BOOST_FUNCTION}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "" boost_function)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_DEBUG}" "${CONAN_LIB_DIRS_BOOST_FUNCTION_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "debug" boost_function)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_RELEASE}" "${CONAN_LIB_DIRS_BOOST_FUNCTION_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "release" boost_function)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_FUNCTION_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "relwithdebinfo" boost_function)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_FUNCTION_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "minsizerel" boost_function)

    add_library(CONAN_PKG::boost_function INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_function PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_bind CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_index CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof)
    set_property(TARGET CONAN_PKG::boost_function PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_FUNCTION}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_FUNCTION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_FUNCTION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_FUNCTION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_FUNCTION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_function PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_function PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_FUNCTION_LIST} ${CONAN_CXX_FLAGS_BOOST_FUNCTION_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_FUNCTION_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_FUNCTION_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_FUNCTION_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_FUNCTION_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_FUNCTION_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_FUNCTION_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_FUNCTION_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_FUNCTION_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_NUMERIC_CONVERSION}" "${CONAN_LIB_DIRS_BOOST_NUMERIC_CONVERSION}"
                                  CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION "${CONAN_SYSTEM_LIBS_BOOST_NUMERIC_CONVERSION} CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "" boost_numeric_conversion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_NUMERIC_CONVERSION_DEBUG}" "${CONAN_LIB_DIRS_BOOST_NUMERIC_CONVERSION_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_NUMERIC_CONVERSION_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "debug" boost_numeric_conversion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_NUMERIC_CONVERSION_RELEASE}" "${CONAN_LIB_DIRS_BOOST_NUMERIC_CONVERSION_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_NUMERIC_CONVERSION_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "release" boost_numeric_conversion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_numeric_conversion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_NUMERIC_CONVERSION_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_NUMERIC_CONVERSION_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_NUMERIC_CONVERSION_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_numeric_conversion)

    add_library(CONAN_PKG::boost_numeric_conversion INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_numeric_conversion PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION} ${CONAN_SHARED_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_NUMERIC_CONVERSION_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_NUMERIC_CONVERSION_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_numeric_conversion PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_NUMERIC_CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_NUMERIC_CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_NUMERIC_CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_NUMERIC_CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_numeric_conversion PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_NUMERIC_CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_NUMERIC_CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_NUMERIC_CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_NUMERIC_CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_numeric_conversion PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_NUMERIC_CONVERSION_LIST} ${CONAN_CXX_FLAGS_BOOST_NUMERIC_CONVERSION_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_NUMERIC_CONVERSION_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_NUMERIC_CONVERSION_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_NUMERIC_CONVERSION_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_NUMERIC_CONVERSION_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_NUMERIC_CONVERSION_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_NUMERIC_CONVERSION_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_NUMERIC_CONVERSION_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_REGEX}" "${CONAN_LIB_DIRS_BOOST_REGEX}"
                                  CONAN_PACKAGE_TARGETS_BOOST_REGEX "${CONAN_SYSTEM_LIBS_BOOST_REGEX} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "" boost_regex)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_REGEX_DEBUG}" "${CONAN_LIB_DIRS_BOOST_REGEX_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_REGEX_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_REGEX_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "debug" boost_regex)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_REGEX_RELEASE}" "${CONAN_LIB_DIRS_BOOST_REGEX_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_REGEX_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_REGEX_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "release" boost_regex)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_REGEX_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_REGEX_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_REGEX_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_REGEX_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_regex)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_REGEX_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_REGEX_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_REGEX_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_REGEX_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_regex)

    add_library(CONAN_PKG::boost_regex INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_regex PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_REGEX} ${CONAN_SHARED_LINKER_FLAGS_BOOST_REGEX_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_REGEX_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_REGEX_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_REGEX_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_REGEX_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_REGEX_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_REGEX_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_REGEX_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_REGEX_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_REGEX_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_REGEX_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_REGEX_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_REGEX_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_REGEX_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_integer CONAN_PKG::boost_iterator CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_regex PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_REGEX}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_REGEX_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_REGEX_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_REGEX_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_REGEX_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_regex PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_REGEX}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_REGEX_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_REGEX_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_REGEX_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_REGEX_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_regex PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_REGEX_LIST} ${CONAN_CXX_FLAGS_BOOST_REGEX_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_REGEX_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_REGEX_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_REGEX_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_REGEX_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_REGEX_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_REGEX_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_REGEX_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_REGEX_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UNORDERED}" "${CONAN_LIB_DIRS_BOOST_UNORDERED}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UNORDERED "${CONAN_SYSTEM_LIBS_BOOST_UNORDERED} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "" boost_unordered)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UNORDERED_DEBUG}" "${CONAN_LIB_DIRS_BOOST_UNORDERED_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UNORDERED_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_UNORDERED_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "debug" boost_unordered)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UNORDERED_RELEASE}" "${CONAN_LIB_DIRS_BOOST_UNORDERED_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UNORDERED_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_UNORDERED_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "release" boost_unordered)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UNORDERED_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_UNORDERED_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UNORDERED_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_UNORDERED_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_unordered)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UNORDERED_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_UNORDERED_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UNORDERED_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_UNORDERED_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_unordered)

    add_library(CONAN_PKG::boost_unordered INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_unordered PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_UNORDERED} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UNORDERED_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UNORDERED_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_UNORDERED_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UNORDERED_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UNORDERED_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_UNORDERED_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UNORDERED_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UNORDERED_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_UNORDERED_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UNORDERED_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UNORDERED_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_UNORDERED_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UNORDERED_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UNORDERED_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_unordered PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_UNORDERED}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_UNORDERED_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_UNORDERED_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_UNORDERED_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_UNORDERED_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_unordered PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_UNORDERED}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_UNORDERED_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_UNORDERED_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_UNORDERED_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_UNORDERED_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_unordered PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_UNORDERED_LIST} ${CONAN_CXX_FLAGS_BOOST_UNORDERED_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_UNORDERED_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_UNORDERED_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_UNORDERED_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_UNORDERED_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_UNORDERED_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_UNORDERED_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_UNORDERED_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_UNORDERED_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_BIND}" "${CONAN_LIB_DIRS_BOOST_BIND}"
                                  CONAN_PACKAGE_TARGETS_BOOST_BIND "${CONAN_SYSTEM_LIBS_BOOST_BIND} CONAN_PKG::boost_config CONAN_PKG::boost_core"
                                  "" boost_bind)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_BIND_DEBUG}" "${CONAN_LIB_DIRS_BOOST_BIND_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_BIND_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_BIND_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_core"
                                  "debug" boost_bind)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_BIND_RELEASE}" "${CONAN_LIB_DIRS_BOOST_BIND_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_BIND_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_BIND_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_core"
                                  "release" boost_bind)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_BIND_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_BIND_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_BIND_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_BIND_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_core"
                                  "relwithdebinfo" boost_bind)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_BIND_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_BIND_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_BIND_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_BIND_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_core"
                                  "minsizerel" boost_bind)

    add_library(CONAN_PKG::boost_bind INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_bind PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_BIND} ${CONAN_SHARED_LINKER_FLAGS_BOOST_BIND_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_BIND_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_BIND_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_BIND_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_BIND_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_BIND_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_BIND_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_BIND_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_BIND_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_BIND_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_BIND_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_BIND_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_BIND_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_BIND_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_core)
    set_property(TARGET CONAN_PKG::boost_bind PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_BIND}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_BIND_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_BIND_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_BIND_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_BIND_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_bind PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_BIND}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_BIND_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_BIND_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_BIND_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_BIND_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_bind PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_BIND_LIST} ${CONAN_CXX_FLAGS_BOOST_BIND_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_BIND_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_BIND_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_BIND_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_BIND_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_BIND_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_BIND_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_BIND_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_BIND_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_INDEX}" "${CONAN_LIB_DIRS_BOOST_TYPE_INDEX}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX "${CONAN_SYSTEM_LIBS_BOOST_TYPE_INDEX} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "" boost_type_index)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_INDEX_DEBUG}" "${CONAN_LIB_DIRS_BOOST_TYPE_INDEX_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_TYPE_INDEX_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "debug" boost_type_index)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_INDEX_RELEASE}" "${CONAN_LIB_DIRS_BOOST_TYPE_INDEX_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_TYPE_INDEX_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "release" boost_type_index)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_INDEX_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_TYPE_INDEX_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_TYPE_INDEX_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_type_index)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_INDEX_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_TYPE_INDEX_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_TYPE_INDEX_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_type_index)

    add_library(CONAN_PKG::boost_type_index INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_type_index PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_INDEX_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_INDEX_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_INDEX_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_INDEX_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_INDEX_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_INDEX_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_INDEX_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_INDEX_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_TYPE_INDEX_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_INDEX_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_INDEX_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_type_index PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_TYPE_INDEX}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_TYPE_INDEX_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_TYPE_INDEX_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_TYPE_INDEX_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_TYPE_INDEX_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_type_index PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_INDEX}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_INDEX_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_INDEX_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_INDEX_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_INDEX_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_type_index PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_TYPE_INDEX_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPE_INDEX_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_TYPE_INDEX_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPE_INDEX_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_TYPE_INDEX_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPE_INDEX_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_TYPE_INDEX_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPE_INDEX_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_TYPE_INDEX_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_TYPE_INDEX_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ITERATOR}" "${CONAN_LIB_DIRS_BOOST_ITERATOR}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ITERATOR "${CONAN_SYSTEM_LIBS_BOOST_ITERATOR} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_optional CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_iterator)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ITERATOR_DEBUG}" "${CONAN_LIB_DIRS_BOOST_ITERATOR_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ITERATOR_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_ITERATOR_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_optional CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_iterator)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ITERATOR_RELEASE}" "${CONAN_LIB_DIRS_BOOST_ITERATOR_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ITERATOR_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_ITERATOR_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_optional CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_iterator)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ITERATOR_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_ITERATOR_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ITERATOR_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_ITERATOR_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_optional CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_iterator)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ITERATOR_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_ITERATOR_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ITERATOR_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_ITERATOR_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_optional CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_iterator)

    add_library(CONAN_PKG::boost_iterator INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_iterator PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_ITERATOR} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ITERATOR_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ITERATOR_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_ITERATOR_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ITERATOR_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ITERATOR_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_ITERATOR_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ITERATOR_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ITERATOR_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_ITERATOR_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ITERATOR_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ITERATOR_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_ITERATOR_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ITERATOR_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ITERATOR_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_concept_check CONAN_PKG::boost_config CONAN_PKG::boost_conversion CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_function_types CONAN_PKG::boost_fusion CONAN_PKG::boost_mpl CONAN_PKG::boost_optional CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_iterator PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_ITERATOR}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_ITERATOR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_ITERATOR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_ITERATOR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_ITERATOR_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_iterator PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_ITERATOR}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_ITERATOR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_ITERATOR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_ITERATOR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_ITERATOR_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_iterator PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_ITERATOR_LIST} ${CONAN_CXX_FLAGS_BOOST_ITERATOR_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_ITERATOR_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_ITERATOR_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_ITERATOR_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_ITERATOR_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_ITERATOR_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_ITERATOR_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_ITERATOR_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_ITERATOR_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER}" "${CONAN_LIB_DIRS_BOOST_CONTAINER}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_intrusive CONAN_PKG::boost_move CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "" boost_container)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CONTAINER_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_intrusive CONAN_PKG::boost_move CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "debug" boost_container)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CONTAINER_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_intrusive CONAN_PKG::boost_move CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "release" boost_container)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CONTAINER_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_intrusive CONAN_PKG::boost_move CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_container)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CONTAINER_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_intrusive CONAN_PKG::boost_move CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_container)

    add_library(CONAN_PKG::boost_container INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_container PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_intrusive CONAN_PKG::boost_move CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_container PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CONTAINER}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CONTAINER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CONTAINER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CONTAINER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CONTAINER_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_container PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_container PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CONTAINER_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTAINER_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CONTAINER_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTAINER_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CONTAINER_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTAINER_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CONTAINER_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTAINER_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CONTAINER_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CONTAINER_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONCEPT_CHECK}" "${CONAN_LIB_DIRS_BOOST_CONCEPT_CHECK}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK "${CONAN_SYSTEM_LIBS_BOOST_CONCEPT_CHECK} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "" boost_concept_check)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONCEPT_CHECK_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CONCEPT_CHECK_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CONCEPT_CHECK_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "debug" boost_concept_check)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONCEPT_CHECK_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CONCEPT_CHECK_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CONCEPT_CHECK_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "release" boost_concept_check)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_concept_check)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONCEPT_CHECK_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CONCEPT_CHECK_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CONCEPT_CHECK_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_concept_check)

    add_library(CONAN_PKG::boost_concept_check INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_concept_check PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONCEPT_CHECK_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONCEPT_CHECK_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONCEPT_CHECK_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONCEPT_CHECK_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONCEPT_CHECK_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONCEPT_CHECK_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CONCEPT_CHECK_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONCEPT_CHECK_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONCEPT_CHECK_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_concept_check PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CONCEPT_CHECK}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CONCEPT_CHECK_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CONCEPT_CHECK_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CONCEPT_CHECK_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_concept_check PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CONCEPT_CHECK}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONCEPT_CHECK_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONCEPT_CHECK_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONCEPT_CHECK_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_concept_check PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CONCEPT_CHECK_LIST} ${CONAN_CXX_FLAGS_BOOST_CONCEPT_CHECK_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CONCEPT_CHECK_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CONCEPT_CHECK_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CONCEPT_CHECK_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CONCEPT_CHECK_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CONCEPT_CHECK_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CONCEPT_CHECK_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CONCEPT_CHECK_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONVERSION}" "${CONAN_LIB_DIRS_BOOST_CONVERSION}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONVERSION "${CONAN_SYSTEM_LIBS_BOOST_CONVERSION} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "" boost_conversion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONVERSION_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CONVERSION_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONVERSION_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CONVERSION_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "debug" boost_conversion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONVERSION_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CONVERSION_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONVERSION_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CONVERSION_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "release" boost_conversion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONVERSION_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CONVERSION_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONVERSION_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CONVERSION_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "relwithdebinfo" boost_conversion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONVERSION_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CONVERSION_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONVERSION_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CONVERSION_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof"
                                  "minsizerel" boost_conversion)

    add_library(CONAN_PKG::boost_conversion INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_conversion PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CONVERSION} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONVERSION_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONVERSION_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CONVERSION_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONVERSION_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONVERSION_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CONVERSION_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONVERSION_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONVERSION_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CONVERSION_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONVERSION_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONVERSION_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CONVERSION_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONVERSION_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONVERSION_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof)
    set_property(TARGET CONAN_PKG::boost_conversion PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_conversion PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_conversion PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CONVERSION_LIST} ${CONAN_CXX_FLAGS_BOOST_CONVERSION_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CONVERSION_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CONVERSION_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CONVERSION_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CONVERSION_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CONVERSION_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CONVERSION_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CONVERSION_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CONVERSION_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUSION}" "${CONAN_LIB_DIRS_BOOST_FUSION}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUSION "${CONAN_SYSTEM_LIBS_BOOST_FUSION} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "" boost_fusion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUSION_DEBUG}" "${CONAN_LIB_DIRS_BOOST_FUSION_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUSION_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_FUSION_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "debug" boost_fusion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUSION_RELEASE}" "${CONAN_LIB_DIRS_BOOST_FUSION_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUSION_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_FUSION_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "release" boost_fusion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUSION_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_FUSION_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUSION_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_FUSION_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_fusion)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUSION_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_FUSION_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUSION_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_FUSION_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility"
                                  "minsizerel" boost_fusion)

    add_library(CONAN_PKG::boost_fusion INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_fusion PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_FUSION} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUSION_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUSION_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_FUSION_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUSION_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUSION_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_FUSION_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUSION_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUSION_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_FUSION_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUSION_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUSION_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_FUSION_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUSION_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUSION_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_function_types CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_tuple CONAN_PKG::boost_type_traits CONAN_PKG::boost_typeof CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_fusion PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_FUSION}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_FUSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_FUSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_FUSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_FUSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_fusion PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_FUSION}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_fusion PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_FUSION_LIST} ${CONAN_CXX_FLAGS_BOOST_FUSION_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_FUSION_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_FUSION_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_FUSION_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_FUSION_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_FUSION_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_FUSION_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_FUSION_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_FUSION_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_OPTIONAL}" "${CONAN_LIB_DIRS_BOOST_OPTIONAL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL "${CONAN_SYSTEM_LIBS_BOOST_OPTIONAL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_optional)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_OPTIONAL_DEBUG}" "${CONAN_LIB_DIRS_BOOST_OPTIONAL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_OPTIONAL_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_optional)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_OPTIONAL_RELEASE}" "${CONAN_LIB_DIRS_BOOST_OPTIONAL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_OPTIONAL_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_optional)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_OPTIONAL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_OPTIONAL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_OPTIONAL_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_optional)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_OPTIONAL_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_OPTIONAL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_OPTIONAL_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_optional)

    add_library(CONAN_PKG::boost_optional INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_optional PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_OPTIONAL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_OPTIONAL_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_OPTIONAL_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_OPTIONAL_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_OPTIONAL_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_OPTIONAL_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_OPTIONAL_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_OPTIONAL_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_OPTIONAL_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_OPTIONAL_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_OPTIONAL_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_optional PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_OPTIONAL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_OPTIONAL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_OPTIONAL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_OPTIONAL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_OPTIONAL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_optional PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_OPTIONAL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_OPTIONAL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_OPTIONAL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_OPTIONAL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_OPTIONAL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_optional PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_OPTIONAL_LIST} ${CONAN_CXX_FLAGS_BOOST_OPTIONAL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_OPTIONAL_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_OPTIONAL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_OPTIONAL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_OPTIONAL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_OPTIONAL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_OPTIONAL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_OPTIONAL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_OPTIONAL_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTRUSIVE}" "${CONAN_LIB_DIRS_BOOST_INTRUSIVE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE "${CONAN_SYSTEM_LIBS_BOOST_INTRUSIVE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_static_assert"
                                  "" boost_intrusive)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTRUSIVE_DEBUG}" "${CONAN_LIB_DIRS_BOOST_INTRUSIVE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_INTRUSIVE_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_static_assert"
                                  "debug" boost_intrusive)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTRUSIVE_RELEASE}" "${CONAN_LIB_DIRS_BOOST_INTRUSIVE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_INTRUSIVE_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_static_assert"
                                  "release" boost_intrusive)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTRUSIVE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_INTRUSIVE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_INTRUSIVE_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_static_assert"
                                  "relwithdebinfo" boost_intrusive)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTRUSIVE_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_INTRUSIVE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_INTRUSIVE_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_static_assert"
                                  "minsizerel" boost_intrusive)

    add_library(CONAN_PKG::boost_intrusive INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_intrusive PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTRUSIVE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTRUSIVE_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTRUSIVE_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTRUSIVE_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTRUSIVE_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTRUSIVE_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTRUSIVE_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTRUSIVE_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_INTRUSIVE_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTRUSIVE_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTRUSIVE_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_static_assert)
    set_property(TARGET CONAN_PKG::boost_intrusive PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_INTRUSIVE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_INTRUSIVE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_INTRUSIVE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_INTRUSIVE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_INTRUSIVE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_intrusive PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_INTRUSIVE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_INTRUSIVE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_INTRUSIVE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_INTRUSIVE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_INTRUSIVE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_intrusive PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_INTRUSIVE_LIST} ${CONAN_CXX_FLAGS_BOOST_INTRUSIVE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_INTRUSIVE_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_INTRUSIVE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_INTRUSIVE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_INTRUSIVE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_INTRUSIVE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_INTRUSIVE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_INTRUSIVE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_INTRUSIVE_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPEOF}" "${CONAN_LIB_DIRS_BOOST_TYPEOF}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPEOF "${CONAN_SYSTEM_LIBS_BOOST_TYPEOF} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "" boost_typeof)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPEOF_DEBUG}" "${CONAN_LIB_DIRS_BOOST_TYPEOF_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPEOF_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_TYPEOF_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "debug" boost_typeof)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPEOF_RELEASE}" "${CONAN_LIB_DIRS_BOOST_TYPEOF_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPEOF_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_TYPEOF_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "release" boost_typeof)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPEOF_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_TYPEOF_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPEOF_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_TYPEOF_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_typeof)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPEOF_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_TYPEOF_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPEOF_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_TYPEOF_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_typeof)

    add_library(CONAN_PKG::boost_typeof INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_typeof PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_TYPEOF} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPEOF_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPEOF_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_TYPEOF_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPEOF_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPEOF_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_TYPEOF_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPEOF_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPEOF_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_TYPEOF_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPEOF_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPEOF_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_TYPEOF_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPEOF_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPEOF_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_typeof PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_TYPEOF}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_TYPEOF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_TYPEOF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_TYPEOF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_TYPEOF_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_typeof PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_TYPEOF}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPEOF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPEOF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPEOF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPEOF_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_typeof PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_TYPEOF_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPEOF_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_TYPEOF_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPEOF_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_TYPEOF_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPEOF_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_TYPEOF_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPEOF_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_TYPEOF_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_TYPEOF_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SMART_PTR}" "${CONAN_LIB_DIRS_BOOST_SMART_PTR}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR "${CONAN_SYSTEM_LIBS_BOOST_SMART_PTR} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "" boost_smart_ptr)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SMART_PTR_DEBUG}" "${CONAN_LIB_DIRS_BOOST_SMART_PTR_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_SMART_PTR_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "debug" boost_smart_ptr)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SMART_PTR_RELEASE}" "${CONAN_LIB_DIRS_BOOST_SMART_PTR_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_SMART_PTR_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "release" boost_smart_ptr)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SMART_PTR_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_SMART_PTR_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_SMART_PTR_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_smart_ptr)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_SMART_PTR_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_SMART_PTR_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_SMART_PTR_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_smart_ptr)

    add_library(CONAN_PKG::boost_smart_ptr INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_smart_ptr PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SMART_PTR_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SMART_PTR_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SMART_PTR_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SMART_PTR_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SMART_PTR_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SMART_PTR_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SMART_PTR_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SMART_PTR_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_SMART_PTR_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_SMART_PTR_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_SMART_PTR_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_move CONAN_PKG::boost_predef CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_smart_ptr PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_SMART_PTR}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_SMART_PTR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_SMART_PTR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_SMART_PTR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_SMART_PTR_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_smart_ptr PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_SMART_PTR}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_SMART_PTR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_SMART_PTR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_SMART_PTR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_SMART_PTR_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_smart_ptr PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_SMART_PTR_LIST} ${CONAN_CXX_FLAGS_BOOST_SMART_PTR_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_SMART_PTR_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_SMART_PTR_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_SMART_PTR_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_SMART_PTR_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_SMART_PTR_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_SMART_PTR_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_SMART_PTR_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_SMART_PTR_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TUPLE}" "${CONAN_LIB_DIRS_BOOST_TUPLE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TUPLE "${CONAN_SYSTEM_LIBS_BOOST_TUPLE} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "" boost_tuple)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TUPLE_DEBUG}" "${CONAN_LIB_DIRS_BOOST_TUPLE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TUPLE_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_TUPLE_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "debug" boost_tuple)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TUPLE_RELEASE}" "${CONAN_LIB_DIRS_BOOST_TUPLE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TUPLE_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_TUPLE_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "release" boost_tuple)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TUPLE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_TUPLE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TUPLE_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_TUPLE_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_tuple)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TUPLE_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_TUPLE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TUPLE_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_TUPLE_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_tuple)

    add_library(CONAN_PKG::boost_tuple INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_tuple PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_TUPLE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TUPLE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TUPLE_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_TUPLE_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TUPLE_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TUPLE_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_TUPLE_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TUPLE_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TUPLE_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_TUPLE_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TUPLE_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TUPLE_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_TUPLE_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TUPLE_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TUPLE_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_tuple PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_TUPLE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_TUPLE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_TUPLE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_TUPLE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_TUPLE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_tuple PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_TUPLE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_TUPLE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_TUPLE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_TUPLE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_TUPLE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_tuple PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_TUPLE_LIST} ${CONAN_CXX_FLAGS_BOOST_TUPLE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_TUPLE_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_TUPLE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_TUPLE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_TUPLE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_TUPLE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_TUPLE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_TUPLE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_TUPLE_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_TYPES}" "${CONAN_LIB_DIRS_BOOST_FUNCTION_TYPES}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_TYPES} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "" boost_function_types)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_TYPES_DEBUG}" "${CONAN_LIB_DIRS_BOOST_FUNCTION_TYPES_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_TYPES_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "debug" boost_function_types)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_TYPES_RELEASE}" "${CONAN_LIB_DIRS_BOOST_FUNCTION_TYPES_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_TYPES_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "release" boost_function_types)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_function_types)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_FUNCTION_TYPES_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_FUNCTION_TYPES_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_FUNCTION_TYPES_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_function_types)

    add_library(CONAN_PKG::boost_function_types INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_function_types PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_TYPES_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_TYPES_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_TYPES_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_TYPES_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_TYPES_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_TYPES_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_FUNCTION_TYPES_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_FUNCTION_TYPES_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_FUNCTION_TYPES_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_mpl CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_function_types PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_FUNCTION_TYPES}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_FUNCTION_TYPES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_FUNCTION_TYPES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_FUNCTION_TYPES_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_function_types PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_TYPES}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_TYPES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_TYPES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_FUNCTION_TYPES_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_function_types PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_FUNCTION_TYPES_LIST} ${CONAN_CXX_FLAGS_BOOST_FUNCTION_TYPES_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_FUNCTION_TYPES_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_FUNCTION_TYPES_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_FUNCTION_TYPES_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_FUNCTION_TYPES_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_FUNCTION_TYPES_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_FUNCTION_TYPES_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_FUNCTION_TYPES_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MOVE}" "${CONAN_LIB_DIRS_BOOST_MOVE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MOVE "${CONAN_SYSTEM_LIBS_BOOST_MOVE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "" boost_move)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MOVE_DEBUG}" "${CONAN_LIB_DIRS_BOOST_MOVE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MOVE_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_MOVE_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "debug" boost_move)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MOVE_RELEASE}" "${CONAN_LIB_DIRS_BOOST_MOVE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MOVE_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_MOVE_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "release" boost_move)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MOVE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_MOVE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MOVE_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_MOVE_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "relwithdebinfo" boost_move)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MOVE_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_MOVE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MOVE_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_MOVE_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "minsizerel" boost_move)

    add_library(CONAN_PKG::boost_move INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_move PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_MOVE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MOVE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MOVE_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_MOVE_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MOVE_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MOVE_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_MOVE_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MOVE_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MOVE_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_MOVE_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MOVE_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MOVE_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_MOVE_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MOVE_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MOVE_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert)
    set_property(TARGET CONAN_PKG::boost_move PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_MOVE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_MOVE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_MOVE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_MOVE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_MOVE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_move PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_MOVE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_MOVE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_MOVE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_MOVE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_MOVE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_move PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_MOVE_LIST} ${CONAN_CXX_FLAGS_BOOST_MOVE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_MOVE_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_MOVE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_MOVE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_MOVE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_MOVE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_MOVE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_MOVE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_MOVE_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MPL}" "${CONAN_LIB_DIRS_BOOST_MPL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MPL "${CONAN_SYSTEM_LIBS_BOOST_MPL} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "" boost_mpl)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MPL_DEBUG}" "${CONAN_LIB_DIRS_BOOST_MPL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MPL_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_MPL_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "debug" boost_mpl)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MPL_RELEASE}" "${CONAN_LIB_DIRS_BOOST_MPL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MPL_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_MPL_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "release" boost_mpl)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MPL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_MPL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MPL_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_MPL_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "relwithdebinfo" boost_mpl)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_MPL_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_MPL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MPL_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_MPL_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility"
                                  "minsizerel" boost_mpl)

    add_library(CONAN_PKG::boost_mpl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_mpl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_MPL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MPL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MPL_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_MPL_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MPL_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MPL_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_MPL_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MPL_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MPL_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_MPL_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MPL_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MPL_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_MPL_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_MPL_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_MPL_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_predef CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits CONAN_PKG::boost_utility)
    set_property(TARGET CONAN_PKG::boost_mpl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_MPL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_MPL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_MPL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_MPL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_MPL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_mpl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_MPL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_MPL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_MPL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_MPL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_MPL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_mpl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_MPL_LIST} ${CONAN_CXX_FLAGS_BOOST_MPL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_MPL_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_MPL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_MPL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_MPL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_MPL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_MPL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_MPL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_MPL_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREDEF}" "${CONAN_LIB_DIRS_BOOST_PREDEF}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREDEF "${CONAN_SYSTEM_LIBS_BOOST_PREDEF} "
                                  "" boost_predef)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREDEF_DEBUG}" "${CONAN_LIB_DIRS_BOOST_PREDEF_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREDEF_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_PREDEF_DEBUG} "
                                  "debug" boost_predef)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREDEF_RELEASE}" "${CONAN_LIB_DIRS_BOOST_PREDEF_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREDEF_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_PREDEF_RELEASE} "
                                  "release" boost_predef)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREDEF_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_PREDEF_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREDEF_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_PREDEF_RELWITHDEBINFO} "
                                  "relwithdebinfo" boost_predef)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREDEF_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_PREDEF_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREDEF_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_PREDEF_MINSIZEREL} "
                                  "minsizerel" boost_predef)

    add_library(CONAN_PKG::boost_predef INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_predef PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_PREDEF} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREDEF_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREDEF_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_PREDEF_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREDEF_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREDEF_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_PREDEF_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREDEF_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREDEF_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_PREDEF_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREDEF_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREDEF_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_PREDEF_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREDEF_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREDEF_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::boost_predef PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_PREDEF}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_PREDEF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_PREDEF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_PREDEF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_PREDEF_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_predef PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_PREDEF}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_PREDEF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_PREDEF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_PREDEF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_PREDEF_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_predef PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_PREDEF_LIST} ${CONAN_CXX_FLAGS_BOOST_PREDEF_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_PREDEF_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_PREDEF_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_PREDEF_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_PREDEF_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_PREDEF_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_PREDEF_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_PREDEF_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_PREDEF_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UTILITY}" "${CONAN_LIB_DIRS_BOOST_UTILITY}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UTILITY "${CONAN_SYSTEM_LIBS_BOOST_UTILITY} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "" boost_utility)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UTILITY_DEBUG}" "${CONAN_LIB_DIRS_BOOST_UTILITY_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UTILITY_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_UTILITY_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "debug" boost_utility)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UTILITY_RELEASE}" "${CONAN_LIB_DIRS_BOOST_UTILITY_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UTILITY_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_UTILITY_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "release" boost_utility)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UTILITY_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_UTILITY_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UTILITY_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_UTILITY_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_utility)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_UTILITY_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_UTILITY_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_UTILITY_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_UTILITY_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_utility)

    add_library(CONAN_PKG::boost_utility INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_utility PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_UTILITY} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UTILITY_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UTILITY_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_UTILITY_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UTILITY_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UTILITY_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_UTILITY_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UTILITY_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UTILITY_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_UTILITY_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UTILITY_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UTILITY_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_UTILITY_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_UTILITY_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_UTILITY_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_container_hash CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_throw_exception CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_utility PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_UTILITY}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_UTILITY_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_UTILITY_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_UTILITY_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_UTILITY_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_utility PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_UTILITY}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_UTILITY_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_UTILITY_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_UTILITY_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_UTILITY_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_utility PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_UTILITY_LIST} ${CONAN_CXX_FLAGS_BOOST_UTILITY_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_UTILITY_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_UTILITY_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_UTILITY_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_UTILITY_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_UTILITY_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_UTILITY_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_UTILITY_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_UTILITY_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THROW_EXCEPTION}" "${CONAN_LIB_DIRS_BOOST_THROW_EXCEPTION}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION "${CONAN_SYSTEM_LIBS_BOOST_THROW_EXCEPTION} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "" boost_throw_exception)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THROW_EXCEPTION_DEBUG}" "${CONAN_LIB_DIRS_BOOST_THROW_EXCEPTION_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_THROW_EXCEPTION_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "debug" boost_throw_exception)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THROW_EXCEPTION_RELEASE}" "${CONAN_LIB_DIRS_BOOST_THROW_EXCEPTION_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_THROW_EXCEPTION_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "release" boost_throw_exception)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "relwithdebinfo" boost_throw_exception)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_THROW_EXCEPTION_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_THROW_EXCEPTION_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_THROW_EXCEPTION_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "minsizerel" boost_throw_exception)

    add_library(CONAN_PKG::boost_throw_exception INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_throw_exception PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THROW_EXCEPTION_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THROW_EXCEPTION_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THROW_EXCEPTION_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THROW_EXCEPTION_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THROW_EXCEPTION_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THROW_EXCEPTION_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_THROW_EXCEPTION_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_THROW_EXCEPTION_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_THROW_EXCEPTION_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config)
    set_property(TARGET CONAN_PKG::boost_throw_exception PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_THROW_EXCEPTION}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_THROW_EXCEPTION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_THROW_EXCEPTION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_THROW_EXCEPTION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_throw_exception PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_THROW_EXCEPTION}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_THROW_EXCEPTION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_THROW_EXCEPTION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_THROW_EXCEPTION_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_throw_exception PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_THROW_EXCEPTION_LIST} ${CONAN_CXX_FLAGS_BOOST_THROW_EXCEPTION_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_THROW_EXCEPTION_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_THROW_EXCEPTION_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_THROW_EXCEPTION_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_THROW_EXCEPTION_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_THROW_EXCEPTION_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_THROW_EXCEPTION_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_THROW_EXCEPTION_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_HASH}" "${CONAN_LIB_DIRS_BOOST_CONTAINER_HASH}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_HASH} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "" boost_container_hash)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_HASH_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CONTAINER_HASH_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_HASH_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "debug" boost_container_hash)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_HASH_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CONTAINER_HASH_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_HASH_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "release" boost_container_hash)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_HASH_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CONTAINER_HASH_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_HASH_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_container_hash)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONTAINER_HASH_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CONTAINER_HASH_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CONTAINER_HASH_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_container_hash)

    add_library(CONAN_PKG::boost_container_hash INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_container_hash PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_HASH_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_HASH_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_HASH_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_HASH_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_HASH_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_HASH_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_HASH_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_HASH_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CONTAINER_HASH_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONTAINER_HASH_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONTAINER_HASH_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_detail CONAN_PKG::boost_integer CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_container_hash PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CONTAINER_HASH}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CONTAINER_HASH_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CONTAINER_HASH_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CONTAINER_HASH_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CONTAINER_HASH_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_container_hash PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_HASH}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_HASH_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_HASH_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_HASH_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONTAINER_HASH_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_container_hash PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CONTAINER_HASH_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTAINER_HASH_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CONTAINER_HASH_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTAINER_HASH_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CONTAINER_HASH_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTAINER_HASH_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CONTAINER_HASH_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CONTAINER_HASH_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CONTAINER_HASH_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CONTAINER_HASH_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTEGER}" "${CONAN_LIB_DIRS_BOOST_INTEGER}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTEGER "${CONAN_SYSTEM_LIBS_BOOST_INTEGER} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "" boost_integer)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTEGER_DEBUG}" "${CONAN_LIB_DIRS_BOOST_INTEGER_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTEGER_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_INTEGER_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "debug" boost_integer)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTEGER_RELEASE}" "${CONAN_LIB_DIRS_BOOST_INTEGER_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTEGER_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_INTEGER_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "release" boost_integer)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTEGER_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_INTEGER_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTEGER_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_INTEGER_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "relwithdebinfo" boost_integer)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_INTEGER_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_INTEGER_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_INTEGER_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_INTEGER_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert"
                                  "minsizerel" boost_integer)

    add_library(CONAN_PKG::boost_integer INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_integer PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_INTEGER} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTEGER_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTEGER_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_INTEGER_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTEGER_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTEGER_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_INTEGER_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTEGER_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTEGER_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_INTEGER_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTEGER_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTEGER_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_INTEGER_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_INTEGER_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_INTEGER_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_static_assert)
    set_property(TARGET CONAN_PKG::boost_integer PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_INTEGER}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_INTEGER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_INTEGER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_INTEGER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_INTEGER_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_integer PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_INTEGER}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_INTEGER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_INTEGER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_INTEGER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_INTEGER_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_integer PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_INTEGER_LIST} ${CONAN_CXX_FLAGS_BOOST_INTEGER_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_INTEGER_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_INTEGER_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_INTEGER_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_INTEGER_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_INTEGER_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_INTEGER_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_INTEGER_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_INTEGER_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DETAIL}" "${CONAN_LIB_DIRS_BOOST_DETAIL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DETAIL "${CONAN_SYSTEM_LIBS_BOOST_DETAIL} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "" boost_detail)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DETAIL_DEBUG}" "${CONAN_LIB_DIRS_BOOST_DETAIL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DETAIL_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_DETAIL_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "debug" boost_detail)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DETAIL_RELEASE}" "${CONAN_LIB_DIRS_BOOST_DETAIL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DETAIL_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_DETAIL_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "release" boost_detail)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DETAIL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_DETAIL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DETAIL_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_DETAIL_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "relwithdebinfo" boost_detail)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_DETAIL_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_DETAIL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DETAIL_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_DETAIL_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits"
                                  "minsizerel" boost_detail)

    add_library(CONAN_PKG::boost_detail INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_detail PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_DETAIL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DETAIL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DETAIL_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_DETAIL_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DETAIL_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DETAIL_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_DETAIL_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DETAIL_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DETAIL_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_DETAIL_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DETAIL_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DETAIL_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_DETAIL_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_DETAIL_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_DETAIL_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_static_assert CONAN_PKG::boost_type_traits)
    set_property(TARGET CONAN_PKG::boost_detail PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_DETAIL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_DETAIL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_DETAIL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_DETAIL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_DETAIL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_detail PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_DETAIL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_DETAIL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_DETAIL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_DETAIL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_DETAIL_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_detail PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_DETAIL_LIST} ${CONAN_CXX_FLAGS_BOOST_DETAIL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_DETAIL_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_DETAIL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_DETAIL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_DETAIL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_DETAIL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_DETAIL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_DETAIL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_DETAIL_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CORE}" "${CONAN_LIB_DIRS_BOOST_CORE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CORE "${CONAN_SYSTEM_LIBS_BOOST_CORE} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "" boost_core)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CORE_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CORE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CORE_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CORE_DEBUG} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "debug" boost_core)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CORE_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CORE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CORE_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CORE_RELEASE} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "release" boost_core)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CORE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CORE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CORE_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CORE_RELWITHDEBINFO} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "relwithdebinfo" boost_core)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CORE_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CORE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CORE_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CORE_MINSIZEREL} CONAN_PKG::boost_assert CONAN_PKG::boost_config"
                                  "minsizerel" boost_core)

    add_library(CONAN_PKG::boost_core INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_core PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CORE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CORE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CORE_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CORE_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CORE_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CORE_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CORE_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CORE_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CORE_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CORE_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CORE_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CORE_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CORE_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CORE_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CORE_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_assert CONAN_PKG::boost_config)
    set_property(TARGET CONAN_PKG::boost_core PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CORE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CORE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CORE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CORE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CORE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_core PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CORE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CORE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CORE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CORE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CORE_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_core PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CORE_LIST} ${CONAN_CXX_FLAGS_BOOST_CORE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CORE_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CORE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CORE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CORE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CORE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CORE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CORE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CORE_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREPROCESSOR}" "${CONAN_LIB_DIRS_BOOST_PREPROCESSOR}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR "${CONAN_SYSTEM_LIBS_BOOST_PREPROCESSOR} "
                                  "" boost_preprocessor)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREPROCESSOR_DEBUG}" "${CONAN_LIB_DIRS_BOOST_PREPROCESSOR_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_PREPROCESSOR_DEBUG} "
                                  "debug" boost_preprocessor)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREPROCESSOR_RELEASE}" "${CONAN_LIB_DIRS_BOOST_PREPROCESSOR_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_PREPROCESSOR_RELEASE} "
                                  "release" boost_preprocessor)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREPROCESSOR_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_PREPROCESSOR_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_PREPROCESSOR_RELWITHDEBINFO} "
                                  "relwithdebinfo" boost_preprocessor)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_PREPROCESSOR_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_PREPROCESSOR_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_PREPROCESSOR_MINSIZEREL} "
                                  "minsizerel" boost_preprocessor)

    add_library(CONAN_PKG::boost_preprocessor INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_preprocessor PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREPROCESSOR_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREPROCESSOR_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREPROCESSOR_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREPROCESSOR_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREPROCESSOR_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREPROCESSOR_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREPROCESSOR_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREPROCESSOR_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_PREPROCESSOR_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_PREPROCESSOR_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_PREPROCESSOR_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::boost_preprocessor PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_PREPROCESSOR}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_PREPROCESSOR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_PREPROCESSOR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_PREPROCESSOR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_PREPROCESSOR_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_preprocessor PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_PREPROCESSOR}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_PREPROCESSOR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_PREPROCESSOR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_PREPROCESSOR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_PREPROCESSOR_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_preprocessor PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_PREPROCESSOR_LIST} ${CONAN_CXX_FLAGS_BOOST_PREPROCESSOR_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_PREPROCESSOR_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_PREPROCESSOR_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_PREPROCESSOR_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_PREPROCESSOR_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_PREPROCESSOR_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_PREPROCESSOR_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_PREPROCESSOR_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_PREPROCESSOR_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_TRAITS}" "${CONAN_LIB_DIRS_BOOST_TYPE_TRAITS}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS "${CONAN_SYSTEM_LIBS_BOOST_TYPE_TRAITS} CONAN_PKG::boost_config CONAN_PKG::boost_static_assert"
                                  "" boost_type_traits)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_TRAITS_DEBUG}" "${CONAN_LIB_DIRS_BOOST_TYPE_TRAITS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_TYPE_TRAITS_DEBUG} CONAN_PKG::boost_config CONAN_PKG::boost_static_assert"
                                  "debug" boost_type_traits)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_TRAITS_RELEASE}" "${CONAN_LIB_DIRS_BOOST_TYPE_TRAITS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_TYPE_TRAITS_RELEASE} CONAN_PKG::boost_config CONAN_PKG::boost_static_assert"
                                  "release" boost_type_traits)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_TRAITS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_TYPE_TRAITS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_TYPE_TRAITS_RELWITHDEBINFO} CONAN_PKG::boost_config CONAN_PKG::boost_static_assert"
                                  "relwithdebinfo" boost_type_traits)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_TYPE_TRAITS_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_TYPE_TRAITS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_TYPE_TRAITS_MINSIZEREL} CONAN_PKG::boost_config CONAN_PKG::boost_static_assert"
                                  "minsizerel" boost_type_traits)

    add_library(CONAN_PKG::boost_type_traits INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_type_traits PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_TRAITS_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_TRAITS_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_TRAITS_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_TRAITS_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_TRAITS_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_TRAITS_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_TRAITS_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_TRAITS_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_TYPE_TRAITS_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_TYPE_TRAITS_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_TYPE_TRAITS_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config CONAN_PKG::boost_static_assert)
    set_property(TARGET CONAN_PKG::boost_type_traits PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_TYPE_TRAITS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_TYPE_TRAITS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_TYPE_TRAITS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_TYPE_TRAITS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_TYPE_TRAITS_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_type_traits PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_TRAITS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_TRAITS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_TRAITS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_TRAITS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_TYPE_TRAITS_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_type_traits PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_TYPE_TRAITS_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPE_TRAITS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_TYPE_TRAITS_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPE_TRAITS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_TYPE_TRAITS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPE_TRAITS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_TYPE_TRAITS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_TYPE_TRAITS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_TYPE_TRAITS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_TYPE_TRAITS_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASSERT}" "${CONAN_LIB_DIRS_BOOST_ASSERT}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASSERT "${CONAN_SYSTEM_LIBS_BOOST_ASSERT} CONAN_PKG::boost_config"
                                  "" boost_assert)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASSERT_DEBUG}" "${CONAN_LIB_DIRS_BOOST_ASSERT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASSERT_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_ASSERT_DEBUG} CONAN_PKG::boost_config"
                                  "debug" boost_assert)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASSERT_RELEASE}" "${CONAN_LIB_DIRS_BOOST_ASSERT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASSERT_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_ASSERT_RELEASE} CONAN_PKG::boost_config"
                                  "release" boost_assert)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASSERT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_ASSERT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASSERT_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_ASSERT_RELWITHDEBINFO} CONAN_PKG::boost_config"
                                  "relwithdebinfo" boost_assert)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_ASSERT_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_ASSERT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_ASSERT_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_ASSERT_MINSIZEREL} CONAN_PKG::boost_config"
                                  "minsizerel" boost_assert)

    add_library(CONAN_PKG::boost_assert INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_assert PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_ASSERT} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASSERT_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASSERT_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_ASSERT_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASSERT_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASSERT_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_ASSERT_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASSERT_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASSERT_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_ASSERT_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASSERT_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASSERT_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_ASSERT_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_ASSERT_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_ASSERT_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config)
    set_property(TARGET CONAN_PKG::boost_assert PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_ASSERT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_ASSERT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_ASSERT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_ASSERT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_ASSERT_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_assert PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_ASSERT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_ASSERT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_ASSERT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_ASSERT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_ASSERT_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_assert PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_ASSERT_LIST} ${CONAN_CXX_FLAGS_BOOST_ASSERT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_ASSERT_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_ASSERT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_ASSERT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_ASSERT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_ASSERT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_ASSERT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_ASSERT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_ASSERT_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_STATIC_ASSERT}" "${CONAN_LIB_DIRS_BOOST_STATIC_ASSERT}"
                                  CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT "${CONAN_SYSTEM_LIBS_BOOST_STATIC_ASSERT} CONAN_PKG::boost_config"
                                  "" boost_static_assert)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_STATIC_ASSERT_DEBUG}" "${CONAN_LIB_DIRS_BOOST_STATIC_ASSERT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_STATIC_ASSERT_DEBUG} CONAN_PKG::boost_config"
                                  "debug" boost_static_assert)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_STATIC_ASSERT_RELEASE}" "${CONAN_LIB_DIRS_BOOST_STATIC_ASSERT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_STATIC_ASSERT_RELEASE} CONAN_PKG::boost_config"
                                  "release" boost_static_assert)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_STATIC_ASSERT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_STATIC_ASSERT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_STATIC_ASSERT_RELWITHDEBINFO} CONAN_PKG::boost_config"
                                  "relwithdebinfo" boost_static_assert)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_STATIC_ASSERT_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_STATIC_ASSERT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_STATIC_ASSERT_MINSIZEREL} CONAN_PKG::boost_config"
                                  "minsizerel" boost_static_assert)

    add_library(CONAN_PKG::boost_static_assert INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_static_assert PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT} ${CONAN_SHARED_LINKER_FLAGS_BOOST_STATIC_ASSERT_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_STATIC_ASSERT_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_STATIC_ASSERT_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_STATIC_ASSERT_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_STATIC_ASSERT_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_STATIC_ASSERT_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_STATIC_ASSERT_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_STATIC_ASSERT_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_STATIC_ASSERT_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_STATIC_ASSERT_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_STATIC_ASSERT_DEBUG_LIST}>
                                                                 CONAN_PKG::boost_config)
    set_property(TARGET CONAN_PKG::boost_static_assert PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_STATIC_ASSERT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_STATIC_ASSERT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_STATIC_ASSERT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_STATIC_ASSERT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_STATIC_ASSERT_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_static_assert PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_STATIC_ASSERT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_STATIC_ASSERT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_STATIC_ASSERT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_STATIC_ASSERT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_STATIC_ASSERT_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_static_assert PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_STATIC_ASSERT_LIST} ${CONAN_CXX_FLAGS_BOOST_STATIC_ASSERT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_STATIC_ASSERT_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_STATIC_ASSERT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_STATIC_ASSERT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_STATIC_ASSERT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_STATIC_ASSERT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_STATIC_ASSERT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_STATIC_ASSERT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_STATIC_ASSERT_DEBUG_LIST}>)


    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONFIG}" "${CONAN_LIB_DIRS_BOOST_CONFIG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONFIG "${CONAN_SYSTEM_LIBS_BOOST_CONFIG} "
                                  "" boost_config)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONFIG_DEBUG}" "${CONAN_LIB_DIRS_BOOST_CONFIG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONFIG_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_CONFIG_DEBUG} "
                                  "debug" boost_config)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONFIG_RELEASE}" "${CONAN_LIB_DIRS_BOOST_CONFIG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONFIG_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_CONFIG_RELEASE} "
                                  "release" boost_config)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONFIG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_CONFIG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONFIG_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_CONFIG_RELWITHDEBINFO} "
                                  "relwithdebinfo" boost_config)
    conan_package_library_targets("${CONAN_LIBS_FRAMEWORKS_BOOST_CONFIG_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_CONFIG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_CONFIG_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_CONFIG_MINSIZEREL} "
                                  "minsizerel" boost_config)

    add_library(CONAN_PKG::boost_config INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost_config PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST_CONFIG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONFIG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONFIG_LIST}
                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_CONFIG_RELEASE} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONFIG_RELEASE_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONFIG_RELEASE_LIST}>
                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_CONFIG_RELWITHDEBINFO} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONFIG_RELWITHDEBINFO_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONFIG_RELWITHDEBINFO_LIST}>
                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_CONFIG_MINSIZEREL} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONFIG_MINSIZEREL_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONFIG_MINSIZEREL_LIST}>
                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_CONFIG_DEBUG} ${CONAN_SHARED_LINKER_FLAGS_BOOST_CONFIG_DEBUG_LIST} ${CONAN_EXE_LINKER_FLAGS_BOOST_CONFIG_DEBUG_LIST}>
                                                                 )
    set_property(TARGET CONAN_PKG::boost_config PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST_CONFIG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_CONFIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_CONFIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_CONFIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_CONFIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_config PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST_CONFIG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONFIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONFIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONFIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_CONFIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost_config PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_CONFIG_LIST} ${CONAN_CXX_FLAGS_BOOST_CONFIG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_CONFIG_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_CONFIG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_CONFIG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_CONFIG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_CONFIG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_CONFIG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_CONFIG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_CONFIG_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::sfml CONAN_PKG::boost CONAN_PKG::boost_asio CONAN_PKG::freetype CONAN_PKG::stb CONAN_PKG::openal CONAN_PKG::flac CONAN_PKG::vorbis CONAN_PKG::boost_coroutine CONAN_PKG::boost_date_time CONAN_PKG::libpng CONAN_PKG::libalsa CONAN_PKG::ogg CONAN_PKG::boost_context CONAN_PKG::boost_thread CONAN_PKG::boost_cycle_group_c CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::boost_chrono CONAN_PKG::boost_pool CONAN_PKG::boost_algorithm CONAN_PKG::boost_endian CONAN_PKG::boost_filesystem CONAN_PKG::boost_foreach CONAN_PKG::boost_lexical_cast CONAN_PKG::boost_locale CONAN_PKG::boost_math CONAN_PKG::boost_phoenix CONAN_PKG::boost_tokenizer CONAN_PKG::boost_tti CONAN_PKG::boost_variant CONAN_PKG::lzma CONAN_PKG::zstd CONAN_PKG::boost_ratio CONAN_PKG::boost_system CONAN_PKG::boost_io CONAN_PKG::boost_cycle_group_b CONAN_PKG::boost_proto CONAN_PKG::boost_rational CONAN_PKG::boost_winapi CONAN_PKG::boost_atomic CONAN_PKG::boost_range CONAN_PKG::boost_lambda CONAN_PKG::boost_cycle_group_a CONAN_PKG::boost_array CONAN_PKG::boost_exception CONAN_PKG::boost_function CONAN_PKG::boost_numeric_conversion CONAN_PKG::boost_regex CONAN_PKG::boost_unordered CONAN_PKG::boost_bind CONAN_PKG::boost_type_index CONAN_PKG::boost_iterator CONAN_PKG::boost_container CONAN_PKG::boost_concept_check CONAN_PKG::boost_conversion CONAN_PKG::boost_fusion CONAN_PKG::boost_optional CONAN_PKG::boost_intrusive CONAN_PKG::boost_typeof CONAN_PKG::boost_smart_ptr CONAN_PKG::boost_tuple CONAN_PKG::boost_function_types CONAN_PKG::boost_move CONAN_PKG::boost_mpl CONAN_PKG::boost_predef CONAN_PKG::boost_utility CONAN_PKG::boost_throw_exception CONAN_PKG::boost_container_hash CONAN_PKG::boost_integer CONAN_PKG::boost_detail CONAN_PKG::boost_core CONAN_PKG::boost_preprocessor CONAN_PKG::boost_type_traits CONAN_PKG::boost_assert CONAN_PKG::boost_static_assert CONAN_PKG::boost_config)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_message(STATUS "Conan: Adjusting language standard")
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()

macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()

macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()

macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                     CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                     CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
            if(DEFINED ${flag})
                string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
            endif()
        endforeach()
        foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
            if(DEFINED ${flag})
                string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
            endif()
        endforeach()
    endif()
endmacro()

macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()

function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()

function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        unset(CONAN_FOUND_LIBRARY CACHE)
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
    endforeach()
    unset(CONAN_FOUND_LIBRARY CACHE)
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()

function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    foreach(_LIBRARY_NAME ${libraries})
        unset(CONAN_FOUND_LIBRARY CACHE)
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            string(REPLACE " " ";" deps_list "${deps}")
            set_property(TARGET ${_LIB_NAME} PROPERTY INTERFACE_LINK_LIBRARIES ${deps_list})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
    endforeach()
    unset(CONAN_FOUND_LIBRARY CACHE)
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()

macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()

macro(conan_set_std)
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
    if(CONAN_STD_CXX_FLAG)
        conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
        set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
    endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()

macro(conan_set_rpath)
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        set(CMAKE_SKIP_RPATH 1)  # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
                                 # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()

macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()

macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()

macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()

macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: 
"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}
"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}
"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])"
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})
function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${CONANINFO})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${CONANINFO})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()

function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL CONAN_COMPILER_VERSION)
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL CONAN_COMPILER_VERSION)
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()

function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()

macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()

macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()

macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()

macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

set(CONAN_USER_BOOST_ASIO_lib_short_names "asio")
set(CONAN_USER_BOOST_COROUTINE_lib_short_names "coroutine")
set(CONAN_USER_BOOST_DATE_TIME_lib_short_names "date_time")
set(CONAN_USER_BOOST_CONTEXT_lib_short_names "context")
set(CONAN_USER_BOOST_THREAD_lib_short_names "thread")
set(CONAN_USER_BOOST_CYCLE_GROUP_C_lib_short_names "date_time,dynamic_bitset,iostreams,multiprecision,random,serialization,spirit,thread")
set(CONAN_USER_BOOST_CHRONO_lib_short_names "chrono")
set(CONAN_USER_BOOST_POOL_lib_short_names "pool")
set(CONAN_USER_BOOST_ALGORITHM_lib_short_names "algorithm")
set(CONAN_USER_BOOST_ENDIAN_lib_short_names "endian")
set(CONAN_USER_BOOST_FILESYSTEM_lib_short_names "filesystem")
set(CONAN_USER_BOOST_FOREACH_lib_short_names "foreach")
set(CONAN_USER_BOOST_LEXICAL_CAST_lib_short_names "lexical_cast")
set(CONAN_USER_BOOST_LOCALE_lib_short_names "locale")
set(CONAN_USER_BOOST_MATH_lib_short_names "math")
set(CONAN_USER_BOOST_PHOENIX_lib_short_names "phoenix")
set(CONAN_USER_BOOST_TOKENIZER_lib_short_names "tokenizer")
set(CONAN_USER_BOOST_TTI_lib_short_names "tti")
set(CONAN_USER_BOOST_VARIANT_lib_short_names "variant")
set(CONAN_USER_BOOST_RATIO_lib_short_names "ratio")
set(CONAN_USER_BOOST_SYSTEM_lib_short_names "system")
set(CONAN_USER_BOOST_IO_lib_short_names "io")
set(CONAN_USER_BOOST_CYCLE_GROUP_B_lib_short_names "lexical_cast,math")
set(CONAN_USER_BOOST_PROTO_lib_short_names "proto")
set(CONAN_USER_BOOST_RATIONAL_lib_short_names "rational")
set(CONAN_USER_BOOST_WINAPI_lib_short_names "winapi")
set(CONAN_USER_BOOST_ATOMIC_lib_short_names "atomic")
set(CONAN_USER_BOOST_RANGE_lib_short_names "range")
set(CONAN_USER_BOOST_LAMBDA_lib_short_names "lambda")
set(CONAN_USER_BOOST_CYCLE_GROUP_A_lib_short_names "algorithm,range")
set(CONAN_USER_BOOST_ARRAY_lib_short_names "array")
set(CONAN_USER_BOOST_EXCEPTION_lib_short_names "exception")
set(CONAN_USER_BOOST_FUNCTION_lib_short_names "function")
set(CONAN_USER_BOOST_NUMERIC_CONVERSION_lib_short_names "numeric_conversion")
set(CONAN_USER_BOOST_REGEX_lib_short_names "regex")
set(CONAN_USER_BOOST_UNORDERED_lib_short_names "unordered")
set(CONAN_USER_BOOST_BIND_lib_short_names "bind")
set(CONAN_USER_BOOST_TYPE_INDEX_lib_short_names "type_index")
set(CONAN_USER_BOOST_ITERATOR_lib_short_names "iterator")
set(CONAN_USER_BOOST_CONTAINER_lib_short_names "container")
set(CONAN_USER_BOOST_CONCEPT_CHECK_lib_short_names "concept_check")
set(CONAN_USER_BOOST_CONVERSION_lib_short_names "conversion")
set(CONAN_USER_BOOST_FUSION_lib_short_names "fusion")
set(CONAN_USER_BOOST_OPTIONAL_lib_short_names "optional")
set(CONAN_USER_BOOST_INTRUSIVE_lib_short_names "intrusive")
set(CONAN_USER_BOOST_TYPEOF_lib_short_names "typeof")
set(CONAN_USER_BOOST_SMART_PTR_lib_short_names "smart_ptr")
set(CONAN_USER_BOOST_TUPLE_lib_short_names "tuple")
set(CONAN_USER_BOOST_FUNCTION_TYPES_lib_short_names "function_types")
set(CONAN_USER_BOOST_MOVE_lib_short_names "move")
set(CONAN_USER_BOOST_MPL_lib_short_names "mpl")
set(CONAN_USER_BOOST_PREDEF_lib_short_names "predef")
set(CONAN_USER_BOOST_UTILITY_lib_short_names "utility")
set(CONAN_USER_BOOST_THROW_EXCEPTION_lib_short_names "throw_exception")
set(CONAN_USER_BOOST_CONTAINER_HASH_lib_short_names "container_hash")
set(CONAN_USER_BOOST_INTEGER_lib_short_names "integer")
set(CONAN_USER_BOOST_DETAIL_lib_short_names "detail")
set(CONAN_USER_BOOST_CORE_lib_short_names "core")
set(CONAN_USER_BOOST_PREPROCESSOR_lib_short_names "preprocessor")
set(CONAN_USER_BOOST_TYPE_TRAITS_lib_short_names "type_traits")
set(CONAN_USER_BOOST_ASSERT_lib_short_names "assert")
set(CONAN_USER_BOOST_STATIC_ASSERT_lib_short_names "static_assert")
set(CONAN_USER_BOOST_CONFIG_lib_short_names "config")